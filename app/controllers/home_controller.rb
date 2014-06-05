class HomeController < ApplicationController
	def download_win
		send_file 'public/co2in-0.8.7.1-win32-setup.exe',
			:type=>"application/exe", 
			:x_sendfile=>true
	end

	def download_osx
		send_file 'public/CO2IN-Qt.dmg',
			:type=>"application/dmg", 
			:x_sendfile=>true
	end
	
	def show
	end
end
