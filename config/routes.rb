Soapbox::Application.routes.draw do
  match 'author/edit' => 'users#edit',     :as => :edit_current_user
  match '+Register'   => 'users#new',      :as => :register
  match '+Login'      => 'sessions#new',     :as => :login
  match '+Logout'     => 'sessions#destroy', :as => :logout

  resources :users
  resources :sessions

  match '/authors' => 'users#index', :as => :authors
  match '/articles' => 'articles#index', :as => :articles
  match '/:username' => 'users#show', :as => :author
  match '/:username/articles/new' => 'articles#new', :as => :new_article
  match '/:username/:article' => 'articles#show', :as => :author_article
  match '/:username/+Destroy' => 'users#destroy', :as => :destroy_current_user
  root :to => 'articles#index'
end

