Rails.application.routes.draw do
 resources :blogs do
 	resources :posts

 	end
  root "blogs#index"
end
