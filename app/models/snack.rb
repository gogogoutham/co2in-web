class Snack < ActiveRecord::Base
	has_many :snack_quotes
	has_many :price_lists, :through => :snack_quotes
	validates :name, presence: true, length: { minimum: 5 }
end
