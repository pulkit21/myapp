Myapp::Application.routes.draw do
  # devise_for :users, path_names: { sign_in: "login", sign_out: "logout" }
	get '/auth/:provider/callback', to: 'sessions#create'
	root :to => "sessions#index"
	resource :session
end
