Bitchmark::Application.routes.draw do
  resources :welcome, only: :index
  resources :accounts, only: [:create, :destroy]
  resources :pages, only: [:create, :destroy]

  get '/:hash_id', to: 'accounts#show'

  root 'welcome#index'
end
