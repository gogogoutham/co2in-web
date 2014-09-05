class SnackQuote < ActiveRecord::Base
  belongs_to :snack
  belongs_to :price_list

  scope :alphabetical, -> { includes(:snack).order('snacks.name') }

  scope :alphabetical_with_balance, -> {
    sqs = alphabetical
    
    # Tack on the balances
  co2in_client = Bitcoin::Client.new(Settings.rpcuser, Settings.rpcpassword, :host => Settings.rpchost, :port => Settings.rpcport)
  co2in_balances = co2in_client.listreceivedbyaddress()
  sqs.each do |sq|
    co2in_balances.each do |cb|
        if cb['address'] == sq.deposit_address
      sq.deposit_balance = cb['amount']
      sq.quantity_purchased = cb['amount'] / sq.price
    end
    end
  end

  sqs
  }

  attr_accessor :deposit_balance, :quantity_purchased

end
