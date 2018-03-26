Rails.application.routes.draw do
  root  'index_page#home'
  devise_for :users
  resources :contents, except: [:index, :new, :show] do
    resources :comments, except: [:index, :new, :show]
    match 'comments/show', to: 'comments#show', via: 'get'
  end
  match 'contents/show', to: 'contents#show', via: 'get'
  match 'contents/show', to: 'contents#search', via: 'post'
end
