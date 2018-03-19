Rails.application.routes.draw do
  devise_scope :user do
    get 'sign_in', to: 'devise/sessions#new'
  end
  devise_for :models
  devise_for :users, controllers: { sessions: 'users/sessions' }
  devise_for :users, path: 'auth', path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: 'cmon_let_me_in' }
  devise_for :users, skip: :all

  #resources :users
  #resources :sessions, only: [:new, :create, :destroy]

  root  'index_page#home'
  match '/signup',  to: 'users#new',            via: 'get'
  match '/signin',  to: 'sessions#new',         via: 'get'
  match '/signout', to: 'sessions#destroy',     via: 'delete'
end
