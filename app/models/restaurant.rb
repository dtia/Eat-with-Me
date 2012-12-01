class Restaurant < ActiveRecord::Base
  attr_accessible :city, :name
  validates :name, :city, :presence => true
  
  def self.create_restaurant(restaurant, city, cuisine)
    new_restaurant = Restaurant.new
    new_restaurant.name = restaurant
    new_restaurant.city = city
    new_restaurant.cuisine = cuisine
    new_restaurant.save
    return new_restaurant.id
  end
end
