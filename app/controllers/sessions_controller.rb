class SessionsController < ApplicationController

	def create
		auth_hash = request.env['omniauth.auth']

		authorization = Authorization.find_by_provider_and_uid(auth_hash["provider"], auth_hash["uid"])

		if authorization
			user = authorization.user
		else
			user = User.create(:name => auth_hash["info"]["name"])
			user.authorizations.new( :provider => auth_hash["provider"], :uid => auth_hash["uid"])
			user.save
		end

		session[:userid] = user.id

		redirect_to root_url
	end

	def destroy
		session[:userid] = nil
		redirect_to root_url
	end

end
