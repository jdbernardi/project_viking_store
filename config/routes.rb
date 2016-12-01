Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :static_pages
  resources :admins

  get '/' => 'static_pages#dashboard'

  get 'index' => 'static_pages#index'

  get 'admins/category' => 'admins#category'


end
