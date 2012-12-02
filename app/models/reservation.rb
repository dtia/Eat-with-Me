class Reservation < ActiveRecord::Base
  attr_accessible :acceptor_id, :date, :restaurant_id, :suggestor_id, :time
  validates :restaurant_id, :suggestor_id, :date, :presence => true
  
  def self.create_listing(uid, date, restaurant, city, cuisine, locu_restaurant_id)
    # get restaurant id
    rest_id = Restaurant.get_or_create_restaurant(restaurant, city, cuisine, locu_restaurant_id)
    # get reservation id
    create_reservation(date, rest_id, uid)
  end
  
  def self.create_reservation(date, restaurant_id, uid)
    @reservation = Reservation.where("restaurant_id = ? and suggestor_id = ?", restaurant_id, uid)
    
    if @reservation.empty?
      new_reservation = Reservation.new
      new_reservation.date = Date.strptime date, '%m/%d/%Y'
      new_reservation.restaurant_id = restaurant_id
      new_reservation.suggestor_id = uid
      new_reservation.save
      Rails.logger.info(new_reservation.errors.inspect)
    end
    
    
  end
end
