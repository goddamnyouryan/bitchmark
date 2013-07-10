Bitchmark::Application.routes.draw do
  resources :welcome, only: :index
  resources :accounts, only: [:create, :destroy]
  resources :groups, only: [:show, :destroy]
  resources :pages, only: [:create, :destroy]

  get '/:hash_id', to: 'accounts#show'

  namespace :api do
    resources :accounts, only: [:show]
    resources :pages, only: [:create, :destroy]
  end

  root 'welcome#index'
end
