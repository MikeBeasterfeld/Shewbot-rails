module ApplicationHelper

	def site_title
		return Settings.site_title unless Settings.site_title.nil?
		return 'Showbot'
	end

	def full_title(page_title)
		base_title = site_title
		if page_title.empty?
			base_title
		else
			"#{base_title} | #{page_title}"
		end
	end

	def check_api_key
		authenticate_or_request_with_http_token do |token, options|
			Api.exists?(api_key: token)
		end
	end

end
