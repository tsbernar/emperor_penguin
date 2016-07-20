class AddLatituteAndLongituteToRestaurant < ActiveRecord::Migration
  def change
    add_column :restaurants, :latitude, :float
    add_column :restaurants, :longitute, :float
  end
end
