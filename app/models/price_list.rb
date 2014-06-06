class PriceList < ActiveRecord::Base
	has_many :snack_quotes, :dependent => :destroy
	accepts_nested_attributes_for :snack_quotes,  :allow_destroy => true
	has_many :snacks, :through => :snack_quotes

	scope :latest, -> { order('creationtime').last }
	scope :all_reverse_chronological, -> { order('creationtime').reverse_order }

	def self.new_from_template(template_price_list)
		# Initialize the current price list
		price_list = PriceList.new(creationtime: Time.now)

		# Append on unfilled prices if template quote exits
		if !(template_price_list.blank?)
			previousSnacks = []
			for sq in template_price_list.snack_quotes
				price_list.snack_quotes.build(price: sq.price, snack: sq.snack)
				previousSnacks << sq.snack
			end
			for snack in Snack.all.order(:name)
				if !(previousSnacks.include? snack)
					sq = snack.snack_quotes.new
					price_list.snack_quotes << sq
				end
			end
		# Otherwise build an entirely new list
		else
			for snack in Snack.all.order(:name)
				sq = snack.snack_quotes.new
				price_list.snack_quotes << sq
			end
		end
		price_list
	end

	def self.new_from_raw_params(price_list_params)
		
		# Filter out discluded snack quotes, and create deposit addresses for those that remain
		final_snack_quotes_attributes = {}
		co2in_client = Bitcoin::Client.new(Settings.rpcuser, Settings.rpcpassword, :host => Settings.rpchost, :port => Settings.rpcport)
		price_list_params[:snack_quotes_attributes].each do |key, sq|
			if sq['include'] == "1"
				final_snack_quotes_attributes[key] = { 
					'snack_id' => sq['snack_id'], 
					'price' => sq['price'], 
					'deposit_address' => co2in_client.new_address(sq['snack_id'].to_s)
				}
			end
		end
		final_price_list_params = { "snack_quotes_attributes" => final_snack_quotes_attributes }

		price_list = PriceList.new(final_price_list_params)
		price_list.creationtime = Time.now
		price_list
	end
end