Myapp::Application.routes.draw do
  devise_for :users, path_names: { sign_in: "login", sign_out: "logout" }

	root :to => "psts#index"
  get "comments/create"
resources :comments
resources :psts
  get "comments/destroy"
resources :psts do
	resources :comments
	
end
  
end
