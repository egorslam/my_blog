Rails.application.routes.draw do
  

 	devise_for :admin_users, ActiveAdmin::Devise.config
 	ActiveAdmin.routes(self)
	devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
 	resources :blogs do
	resources :posts

 	end
		  root 'posts#index'
		  get '/about', to: 'pages#about'
end
