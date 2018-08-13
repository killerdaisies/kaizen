Rails.application.routes.draw do
    namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :users do
        resources :events, only: [:index, :new, :create]
        resources :bookings, only: [:index, :new, :create]
      end
      resources :events, only: [:show, :edit, :update, :destroy]
      resources :bookings, only: [:show, :edit, :update, :destroy]
      post '/login', to: 'login#login'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
