module SessionsHelper

	def sign_in(user)
		remember_token = User.new_remember_token
		cookies.permanent[:remember_token] = remember_token
		user.update_attribute(:remember_token, User.encrypt(remember_token))
		self.current_user = user
	end

	def current_user=(user)
		@current_user = user
	end

	def current_user
		remember_token = User.encrypt(cookies[:remember_token])
		@current_user ||= User.find_by_remember_token(remember_token)
	end

	def signed_in?
		!current_user.nil?
	end

	def check_admin
		check_oauth
		if admin?
			return true
		else
			redirect_to root_url
		end
	end

	def admin?
		if current_user && current_user.admin
			return true
		else
			return false
		end
	end

	def check_oauth
		unless signed_in?
			redirect_to "/auth/twitter"
		end
	end

end
