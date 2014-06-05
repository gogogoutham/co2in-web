class MarketplaceController < ApplicationController
	def show
		@marketplace = PriceList.latest
	end
end