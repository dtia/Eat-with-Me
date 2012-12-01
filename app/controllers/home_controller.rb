class HomeController < ApplicationController
  # need to validate presence of these params
  def search
    city = params[:city]
    restaurant = params[:restaurant]
    cuisine = params[:cuisine]
    gender = params[:gender]
    gender_target = params[:gender_target]
    date = params[:date]
    
    # search for listings which match criteria
    restaurant_ids = Restaurant.where(["city = ?", city])
    gender_ids = User.where(["gender = ?", gender_target])
    reservation_ids = restaurant_ids | reservation_ids
    @reservations = Reservation.where( reservation_ids )
    
    # if listing doesn't exist, create one
    if !@reservations
      create_listing(date, restaurant, city, cuisine) # pass user id
    end
    
    puts @reservations
  end
  
  private
    def create_listing(date, restaurant, city, cuisine)
      
      # get restaurant id
      rest_id = get_restaurant_id(restaurant, city, cuisine)
    end
    
    def get_reservation_id(date, restaurant_id, user_id)
      new_reservation = Reservation.new
      new_reservation.date = date
      new_reservation.restaurant_id = restaurant_id
      new_reservation.suggestor_id = user_id
    end
    
    def get_restaurant_id(restaurant, city, cuisine)
      new_restaurant = Restaurant.new
      new_restaurant.name = restaurant
      new_restaurant.city = city
      new_restaurant.cuisine = cuisine
      new_restaurant.save
      return new_restaurant.id
    end
end
