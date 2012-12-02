class Restaurant < ActiveRecord::Base
  attr_accessible :city, :name
  validates :name, :city, :presence => true
  
  def self.get_or_create_restaurant(restaurant, city, cuisine, locu_restaurant_id)
    puts restaurant
    puts city
    puts locu_restaurant_id
    @restaurant = Restaurant.where("name = ? and city = ? and locu_id = ?", restaurant, city, locu_restaurant_id)
    
    if @restaurant.empty?
      new_restaurant = Restaurant.new
      new_restaurant.name = restaurant
      new_restaurant.city = city
      new_restaurant.cuisine = cuisine
      new_restaurant.locu_id = locu_restaurant_id
      new_restaurant.save
      return new_restaurant.id
    else
      return @restaurant[0].id
    end
  end
end
