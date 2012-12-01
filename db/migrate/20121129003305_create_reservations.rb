class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.date :date
      t.time :time
      t.integer :restaurant_id
      t.integer :suggestor_id
      t.integer :acceptor_id

      t.timestamps
    end
  end
end
