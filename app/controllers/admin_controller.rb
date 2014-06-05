class AdminController < ApplicationController
	before_filter :authenticate

	protected
		def authenticate
			authenticate_or_request_with_http_basic('Administration') do |username, password|
				username == Settings.admin_username && password == Settings.admin_password
				# password_hash = Digest::MD5.hexdigest(password)
				# username == Settings.admin_username && password == Settings.admin_password_hash
			end
		end
end
