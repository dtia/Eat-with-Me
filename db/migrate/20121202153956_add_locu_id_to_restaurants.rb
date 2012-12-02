class AddLocuIdToRestaurants < ActiveRecord::Migration
  def change
    add_column :restaurants, :locu_id, :text
  end
end
