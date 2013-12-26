OmniAuth.config.logger = Rails.logger
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, 'GvuxqwGgvBMxd2DrfhQwQ', 'kGwd9QPCoYIz9Efe8Kn0a1SgJzazfSWSAmIgtbk'
  {
    :secure_image_url => 'true',
    :image_size => 'original',
    :authorize_params => {
     	:force_login => 'true'
  	}
  }
end