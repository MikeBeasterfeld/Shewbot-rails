Rails.application.config.middleware.use OmniAuth::Builder do 
	provider :twitter, ENV['TWITTER_CONSUMER_KEY'], ENV['TWITTER_CONSUMER_SECRET']
	  {
	    :secure_image_url => 'true',
	    :image_size => 'original',
	    :authorize_params => {
	      :lang => 'en'
	    }
	  }	
end
