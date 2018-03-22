Rails.application.routes.draw do
  root  'index_page#home'
  devise_for :users
  resources :contents, except: [:index, :new, :show]
  match 'contents/show', to: 'contents#show', via: 'get'
  match 'contents/show', to: 'contents#search', via: 'post'
end
