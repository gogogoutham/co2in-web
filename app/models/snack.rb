class Snack < ActiveRecord::Base
	has_many :snack_quotes
	has_many :price_lists, :through => :snack_quotes
	validates :name, presence: true, length: { minimum: 5 }
	
	scope :alphabetical_with_balance, -> {
	  	snacks = includes(:snack_quotes, :price_lists).order(:name)

	  	# Tack on balances and associated statistics
	  	co2in_client = Bitcoin::Client.new(Settings.rpcuser, Settings.rpcpassword, :host => Settings.rpchost, :port => Settings.rpcport)
	  	snacks.each do |snack|
	  		snack.total_deposit_balance = 0.0
	  		snack.total_quantity_purchased = 0.0
	  		snack.firstlisttime = nil
	  		snack.lastlisttime = nil
	  		snack.snack_quotes.each do |sq|
	  			address_balance = co2in_client.getreceivedbyaddress(sq.deposit_address)
	  			snack.total_deposit_balance += address_balance
	  			snack.total_quantity_purchased += (address_balance / sq.price)
	  			if snack.firstlisttime.nil? || sq.price_list.creationtime < snack.firstlisttime
	  				snack.firstlisttime = sq.price_list.creationtime
	  			end
	  			if snack.lastlisttime.nil? || sq.price_list.creationtime > snack.lastlisttime
	  				snack.lastlisttime = sq.price_list.creationtime
	  			end
	  		end
	  		if snack.total_quantity_purchased > 0
	  			snack.average_price = snack.total_deposit_balance / snack.total_quantity_purchased
	  		end
	  	end

	  	snacks
	}

	attr_accessor :total_deposit_balance, :total_quantity_purchased, :firstlisttime, :lastlisttime, :average_price
end
