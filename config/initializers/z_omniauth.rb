Rails.application.config.middleware.use OmniAuth::Builder do 
	provider :twitter, Settings.twitter_consumer_key, Settings.twitter_consumer_secret
	  {
	    :secure_image_url => 'true',
	    :image_size => 'original',
	    :authorize_params => {
	      :lang => 'en',
	      :use_authorize => true
	    }
	  }	
end

