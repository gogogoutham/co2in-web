class CreatePriceLists < ActiveRecord::Migration
  def change
    create_table :price_lists do |t|
      t.datetime :creationtime

      t.timestamps
    end
  end
end
