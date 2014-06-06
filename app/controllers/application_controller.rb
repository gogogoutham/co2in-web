class ApplicationController < ActionController::Base
 	# Prevent CSRF attacks by raising an exception.
	# For APIs, you may want to use :null_session instead.
	protect_from_forgery with: :exception
	# before_filter :authenticate

	# protected
	# 	def authenticate
	# 		authenticate_or_request_with_http_basic('Restricted') do |username, password|
	# 			(username == Settings.access_username && password == Settings.access_password) || 
	# 			(username == Settings.admin_username && password == Settings.admin_password)
	# 			# password_hash = Digest::MD5.hexdigest(password)
	# 			# username == Settings.access_username && password == Settings.access_password_hash
	# 		end
	# 	end
end
