Rails.application.routes.draw do
  resources :usuarios, except: [:destroy]
  resources :pecas
  resources :demandas
end
