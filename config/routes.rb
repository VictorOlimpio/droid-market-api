Rails.application.routes.draw do
  resources :usuarios, only: [:index, :show]
  resources :pecas
  resources :demandas
end
