class AddDepositAddressToSnackQuotes < ActiveRecord::Migration
  def change
    add_column :snack_quotes, :deposit_address, :string
  end
end
