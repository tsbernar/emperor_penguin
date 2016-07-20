class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.text :description
      t.string :address
      t.string :zip
      t.string :city
      t.string :state
      t.string :type
      t.integer :cost

      t.timestamps null: false
    end
    add_index :restaurants, :zip
    add_index :restaurants, :name
  end
end
