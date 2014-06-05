class SnackQuote < ActiveRecord::Base
  belongs_to :snack
  belongs_to :price_list

  scope :alphabetical, -> { includes(:snack).order('snacks.name') }
end
