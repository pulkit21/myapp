Myapp::Application.routes.draw do
  devise_for :users, path_names: { sign_in: "login", sign_out: "logout" },
  										controllers: { omniauth_callbacks: "omniauth_callbacks" }
 #  get '/auth/:provider/callback', to: 'psts#create'
	# root :to => "psts#index"
 #  get "comments/create"
	# resources :comments
	# resources :psts
 #  get "comments/destroy"
	# resources :psts do
	# 	resources :comments
	# end
	resources :twitter
  match '/twitter_profile' => "twitter#twitter_profile"
  match '/oauth_account' => "twitter#oauth_account"
  match '/twitter_oauth_url' => 'twitter#generate_twitter_oauth_url'

  root :to => "twitter#index"
end
