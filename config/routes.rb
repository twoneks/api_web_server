Rails.application.routes.draw do
  apipie
  mount_devise_token_auth_for 'User', at: 'auth'
  resources :restricted, only: [:index]
end
