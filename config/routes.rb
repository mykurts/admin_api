Rails.application.routes.draw do
  mount_devise_token_auth_for 'Account::Administrator', skip: [:token_validations, :sessions, :passwords, :registrations, :confirmations]
  namespace :api do
    namespace :v1 do
      namespace :admin do
        resources :sessions, only: [:create, :destroy]
      end
    end
  end
end
