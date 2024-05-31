Rails.application.routes.draw do
  devise_for :users
  get 'prototypes/index'
  root to: "prototypes#index"
  resources :prototypes, except: [:destroy] do
    resources :comments, only: [:create]
  end
  resources :users, only: [:show]
  delete 'prototypes/:id', to: 'prototypes#destroy', as: 'delete_prototype'
end
