class HomeController < ApplicationController
  def search
    # need to validate presence of these params
    city = params[:city]
    restaurant = params[:restaurant]
    cuisine = params[:cuisine]
    gender = params[:gender]
    gender_target = params[:gender_target]
    date = params[:date]
    name = params[:name]
    uid = params[:uid]
    
    # search for reservations where city is the same and "looking for" gender matches
    @gender_ids = User.where(["gender = ?", gender_target])
    @restaurant_ids = Restaurant.where(["city = ?", city])     
    @reservations = Reservation.where(["restaurant_id in (?) and suggestor_id in (?)", @restaurant_ids, @gender_ids])
    
    # if listing doesn't exist, create one
    if @reservations.length == 0
      uid = User.get_or_create_user(uid, name, city, gender)
      restaurant_id = Restaurant.get_or_create_restaurant(restaurant, city, cuisine)
      Reservation.create_listing(uid, date, restaurant, city, cuisine)
    end
  end
  
end
