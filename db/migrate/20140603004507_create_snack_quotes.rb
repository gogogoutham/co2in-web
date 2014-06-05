class CreateSnackQuotes < ActiveRecord::Migration
  def change
    create_table :snack_quotes do |t|
      t.decimal :price
      t.references :snack, index: true
      t.references :price_list, index: true

      t.timestamps
    end
  end
end
