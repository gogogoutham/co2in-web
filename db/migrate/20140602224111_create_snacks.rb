class CreateSnacks < ActiveRecord::Migration
  def change
    create_table :snacks do |t|
      t.string :name
      t.text :description
      t.string :deposit_address

      t.timestamps
    end
  end
end
