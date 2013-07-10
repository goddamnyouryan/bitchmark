Bitchmark::Application.routes.draw do
  get "groups/show"
  resources :welcome, only: :index
  resources :accounts, only: [:create, :destroy]
  resources :pages, only: [:create, :destroy]
  resources :groups, only: [:show, :destroy]

  get '/:hash_id', to: 'accounts#show'

  root 'welcome#index'
end
