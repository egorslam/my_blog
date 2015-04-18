Rails.application.routes.draw do
 devise_for :users
 resources :blogs do
 	resources :posts

 	end
  root 'pages#home'

	get '/about', to: 'pages#about'
end
