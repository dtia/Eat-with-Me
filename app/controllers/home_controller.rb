class HomeController < ApplicationController
  # need to validate presence of these params
  def search
    city = params[:city]
    restaurant = params[:restaurant]
    cuisine = params[:cuisine]
    gender = params[:gender]
    gender_target = params[:gender_target]
    date = params[:date]
    name = params[:name]
    
    # search for reservations where city is the same and "looking for" gender matches
    @gender_ids = User.where(["gender = ?", gender_target])
    @restaurant_ids = Restaurant.where(["city = ?", city])
     
    #reservation_ids = restaurant_ids | reservation_ids
    @reservations = Reservation.where(["restaurant_id in (?) and suggestor_id in (?)", @restaurant_ids, @gender_ids])
    
    # if listing doesn't exist, create one
    if @reservations.length == 0
      uid = User.create_user(name, city, gender)
      Reservation.create_listing(uid, date, restaurant, city, cuisine)
    else
      # show results

    end
  end
  
end
