class AddCuisineColumnToRestaurants < ActiveRecord::Migration
  def change
    add_column :restaurants, :cuisine, :text
  end
end
