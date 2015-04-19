Rails.application.routes.draw do
 devise_for :users
 resources :blogs do
 	resources :posts

 	end
  root 'home_page#index'
  get '/about', to: 'pages#about'
end
