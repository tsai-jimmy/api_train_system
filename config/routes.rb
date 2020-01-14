Rails.application.routes.draw do
  namespace :api, :defaults => { :format => :json } do
    namespace :v1 do
      resources :trains, :only => [:index, :show]
      resources :reservations, param: :booking_code, :only => [:show, :create, :update, :destroy]
    end
  end
end
