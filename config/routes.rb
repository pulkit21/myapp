Myapp::Application.routes.draw do
	root :to => "psts#index"
  get "comments/create"
resources :comments
resources :psts
  get "comments/destroy"
resources :psts do
	resources :comments
	
end
  
end
