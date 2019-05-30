Rails.application.routes.draw do
  mount_devise_token_auth_for 'Usuario', at: 'auth'
  resources :usuarios, except: :create
  resources :pecas
  resources :demandas
end
