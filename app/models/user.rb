class User < ActiveRecord::Base
  attr_accessible :age, :city, :gender, :name
  validates :name, :city, :gender, :presence => true
  
  def self.get_or_create_user(uid, name, city, gender, gender_target)
    if User.exists?(uid)
      user = User.find(uid)
      return user.id
    else    
      new_user = User.new
      new_user.id = uid
      new_user.name = name
      new_user.city = city
      new_user.gender = gender
      new_user.gender_target = gender_target
      new_user.save
      return new_user.id
    end
  end
end
