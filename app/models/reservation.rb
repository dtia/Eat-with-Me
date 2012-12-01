class Reservation < ActiveRecord::Base
  attr_accessible :acceptor_id, :date, :restaurant_id, :suggestor_id, :time
  validates :restaurant_id, :suggestor_id, :date, :presence => true
  
  def self.create_listing(uid, date, restaurant, city, cuisine)
    # get restaurant id
    rest_id = Restaurant.create_restaurant(restaurant, city, cuisine)
    # get reservation id
    create_reservation(date, rest_id, uid)
  end
  
  def self.create_reservation(date, restaurant_id, uid)
    new_reservation = Reservation.new
    new_reservation.date = date
    new_reservation.restaurant_id = restaurant_id
    new_reservation.suggestor_id = uid
  end
end
