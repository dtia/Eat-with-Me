class User < ActiveRecord::Base
  attr_accessible :age, :city, :gender, :name
  validates :name, :city, :gender, :presence => true
  
  def self.create_user(name, city, gender)
    new_user = User.new
    new_user.name = name
    new_user.city = city
    new_user.gender = gender
    return new_user.id
  end
end
