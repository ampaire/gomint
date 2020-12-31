Rails.application.routes.draw do

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
   # Routes Root
  root 'welcome#index'

  devise_for :users, skip: [:registrations, :sessions]

  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      devise_for :users, controllers: { sessions: 'api/v1/sessions', registrations: 'api/v1/registrations' }

      # Users routes
      resources :users do
        collection do
          get :forgot_password
        end
      end
      resources :vehicles
      get 'show_vehicle_by_user', to: "vehicles#show_vehicle_by_user"

    end
  end
end



