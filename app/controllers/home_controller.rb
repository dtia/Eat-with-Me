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
    if gender_target == 'men'
      gender_target = 'male'
    elsif gender_target == 'women'
      gender_target = 'female'
    end
    
    @gender_ids = User.where(["gender = ? and gender_target = ?", gender_target, gender])
    @restaurant_ids = Restaurant.where(["city = ?", city])     
    @reservations = Reservation.where(["restaurant_id in (?) and suggestor_id in (?)", @restaurant_ids, @gender_ids])
    
    @users = User.find(:all, :select => 'id, name')
    username_hash = Hash.new
    for user in @users do
      username_hash[user.id] = user.name
    end
    
    
    # if listing doesn't exist, create one
    if @reservations.length == 0
      uid = User.get_or_create_user(uid, name, city, gender, gender_target)
      restaurant_id = Restaurant.get_or_create_restaurant(restaurant, city, cuisine)
      Reservation.create_listing(uid, date, restaurant, city, cuisine)
    end
  end
  
end
