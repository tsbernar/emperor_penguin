class FixSpellingOnLongitudeColumnOfRestaurants < ActiveRecord::Migration
  def change
    add_column :restaurants, :longitude, :float
    remove_column :restaurants, :longitute, :float
  end
end
