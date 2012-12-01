class User < ActiveRecord::Base
  attr_accessible :age, :city, :gender, :name
end
