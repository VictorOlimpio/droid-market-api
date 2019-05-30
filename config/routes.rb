Rails.application.routes.draw do
  mount_devise_token_auth_for 'Usuario', at: 'auth'
  resources :usuarios do
    resource :demandas, only: :show
  end
  resources :pecas do
    resource :demandas, only: :show
  end
  resources :demandas do
    resource :usuario, only: :show
    resource :peca, only: :show
  end
end
