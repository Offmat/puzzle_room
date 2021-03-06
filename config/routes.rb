Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: redirect('/puzzles')

  resources :puzzles
  resources :users, only: [:index, :show]
  resources :companies
  resources :inventors
  resources :materials
  resources :countries, only: [:index, :create, :destroy]
  resources :rates, only: [:create, :destroy]
  resources :comments, only: [:create, :destroy]
  resources :possesions, only: [:create, :update]
end
