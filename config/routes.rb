Rails.application.routes.draw do
  mount_devise_token_auth_for 'Account::Administrator', skip: [:token_validations, :sessions, :passwords, :registrations, :confirmations]
  namespace :api do
    namespace :v1 do
      namespace :admin do
        resources :sessions, path: '', only: [] do
          collection do
            post :login, to: 'sessions#create'
            delete :logout, to: 'sessions#destroy'
          end
        end
        resources :users, only: [:index]
      end
    end
  end
end
