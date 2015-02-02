class SessionsController < ApplicationController
	def visitor_count
		render json: {:visitors => Cache.visitor_count}
	end
end
