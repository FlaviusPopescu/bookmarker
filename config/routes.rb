Bookmarker::Application.routes.draw do

  get 'sign_in', to: 'sessions#new'
  delete 'sign_out', to: 'sessions#destroy'

  resources :sessions, only: :create
  resources :bookmarks
  resources :tags

  root to: 'bookmarks#index'
end
