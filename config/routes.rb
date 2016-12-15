Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :static_pages
  resources :admins do

  	resources :categories

  end

  get '/' => 'static_pages#index'

  get '/admin/user/addresses/' => 'addresses#index'

 	scope '/admin' do
 		resources :categories
 		resources :products
 		resources :users

 		scope 'user' do

 			resources :addresses

 		end

 	end

 	patch '/admin/user/addresses/update' => 'addresses#update'


 	post '/admin/user/addresses/new' => 'addresses#create'


end
