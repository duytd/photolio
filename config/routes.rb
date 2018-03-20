Rails.application.routes.draw do
  devise_for :users
  root  'index_page#home'
end
