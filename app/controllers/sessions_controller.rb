class SessionsController < ApplicationController
	def index
  end

  def create
  	# @user = User.find_or_create_from_auth_hash(auth_hash)
   #  self.current_user = @user
   #  redirect_to '/'
   # raise env["omniauth.auth"].to_yaml
   # @user = User.find_or_create_for_twitter(env["omniauth.auth"])
   # flash[:notice] = "Signed in with Twitter successfully."
   # omni = request.env['omniauth.auth']
   # session = Session.find_by_provider_and_uid(omni['provider'], omni['uid'])
   user = User.from_omniauth(env['omniauth.auth'])
  
  end

  def destroy
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end
