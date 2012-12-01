class Reservation < ActiveRecord::Base
  attr_accessible :acceptor_id, :date, :restaurant_id, :suggestor_id, :time
end
