require 'set'

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
    locu_restaurant_id = params[:locu_restaurant_id]
    
    # search for reservations where city is the same and "looking for" gender matches
    if gender_target == 'men'
      gender_target = 'male'
    elsif gender_target == 'women'
      gender_target = 'female'
    end
    
    @gender_ids = User.where(["gender = ? and gender_target = ?", gender_target, gender])
    @restaurant_ids = Restaurant.where(["city = ?", city])     
    @reservations = Reservation.where(["restaurant_id in (?) and suggestor_id in (?)", @restaurant_ids, @gender_ids])
    
    @users = User.find(:all, :select => 'id, name, description')
    @user_hash = Hash.new
    for user in @users do
      @user_hash[user.id] = user
    end
    
    @restaurants = Restaurant.find(:all, :select => 'id, name')
    @restaurant_hash = Hash.new
    for restaurant in @restaurants do
      @restaurant_hash[restaurant.id] = restaurant.name
    end
    
    @restaurants = Restaurant.find(:all, :select => 'id, locu_id')
    @restaurant_locu_hash = Hash.new
    for restaurant in @restaurants do
      @restaurant_hash[restaurant.id] = restaurant.locu_id
    end
    
    # if listing doesn't exist, create one
    if @reservations.length == 0
      uid = User.get_or_create_user(uid, name, city, gender, gender_target)
      restaurant_id = Restaurant.get_or_create_restaurant(restaurant, city, cuisine, locu_restaurant_id)
      Reservation.create_listing(uid, date, restaurant, city, cuisine, locu_restaurant_id)
    end
  end
  
end
