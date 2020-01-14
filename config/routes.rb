Rails.application.routes.draw do
  devise_for :users
  namespace :api, :defaults => { :format => :json } do
    namespace :v1 do
      resources :trains, param: :train_number, :only => [:index, :show]
      resources :reservations, param: :booking_code, :only => [:index, :show, :create, :update, :destroy]

      post "/signup" => "auth#signup"
      post "/login" => "auth#login"
      post "/logout" => "auth#logout"

      get "/me" => "users#show", :as => :user
      patch "/me" => "users#update", :as => :update_user
    end
  end
  root "welcome#index"
end
