Bitchmark::Application.routes.draw do
  resources :welcome, only: :index
  resources :accounts, only: [:create, :destroy]
  resources :pages, only: [:create, :destroy]
  resources :groups, only: [:show, :destroy]

  get '/:hash_id', to: 'accounts#show'

  namespace :api do
    resources :accounts, only: [:show]
  end

  root 'welcome#index'
end
