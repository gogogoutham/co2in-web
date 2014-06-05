class RemoveDepositAddressFromSnacks < ActiveRecord::Migration
  def change
    remove_column :snacks, :deposit_address, :string
  end
end
