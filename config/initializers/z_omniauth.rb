Rails.application.config.middleware.use OmniAuth::Builder do 
	provider :twitter, Settings.twitter_consumer_secret, Settings.twitter_consumer_key
	  {
	    :secure_image_url => 'true',
	    :image_size => 'original',
	    :authorize_params => {
	      :lang => 'en'
	    }
	  }	
end
