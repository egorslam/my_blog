Rails.application.routes.draw do
 	devise_for :admin_users, ActiveAdmin::Devise.config
 	ActiveAdmin.routes(self)
	devise_for :users
 	resources :blogs do
	resources :posts

 	end
		  root 'posts#index'
		  get '/about', to: 'pages#about'
end
