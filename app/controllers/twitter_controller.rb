class TwitterController < ApplicationController
  before_filter :authenticate_user!

  def index
    unless TwitterOauthSetting.find_by_user_id(current_user.id).nil?
   		redirect_to "/twitter_profile"
  	end
  end

  def generate_twitter_oauth_url
   	oauth_callback = "http://#{request.host}:#{request.port}/oauth_account"
		@consumer = OAuth::Consumer.new("GvuxqwGgvBMxd2DrfhQwQ","kGwd9QPCoYIz9Efe8Kn0a1SgJzazfSWSAmIgtbk", :site => "https://api.twitter.com")
		@request_token = @consumer.get_request_token(:oauth_callback => oauth_callback)
    session[:request_token] = @request_token
		redirect_to @request_token.authorize_url(:oauth_callback => oauth_callback)
  end

	def oauth_account
    if TwitterOauthSetting.find_by_user_id(current_user.id).nil?
      @request_token = session[:request_token]
      @access_token = @request_token.get_access_token(:oauth_verifier => params["oauth_verifier"])
      TwitterOauthSetting.create(atoken: @access_token.token, asecret: @access_token.secret, user_id: current_user.id)
      update_user_account()
    end
    redirect_to "/twitter_profile"
  end

  def twitter_profile
  	# debugger
    @user_timeline = get_client.user_timeline
    @home_timeline = get_client.home_timeline
  end

  private

  def get_client
    Twitter::REST::Client.new do |config|
      config.consumer_key = "GvuxqwGgvBMxd2DrfhQwQ"
      config.consumer_secret = "kGwd9QPCoYIz9Efe8Kn0a1SgJzazfSWSAmIgtbk"
		  config.access_token = "2162774353-UjgutlmR07GyX1JTVecL6r5X6aEemIm9a5xUUbB"
		  config.access_token_secret = "JSLx3f2ckNmJx2MMGtO4HxD28oZcUULoAM1inODgxciDR"
    end	

    # Twitter::Client.new(
	   #  :oauth_token => TwitterOauthSetting.find_by_user_id(current_user.id).atoken,
	   #  :oauth_token_secret => TwitterOauthSetting.find_by_user_id(current_user.id).asecret
    # )

 	end
        
 	def update_user_account
    user_twitter_profile = get_client.user
    current_user.update_attributes({
      name: user_twitter_profile.name, 
      screen_name: user_twitter_profile.screen_name, 
      url: user_twitter_profile.url, 
      profile_image_url: user_twitter_profile.profile_image_url, 
      location: user_twitter_profile.location, 
      description: user_twitter_profile.description
    })
  end
        
end