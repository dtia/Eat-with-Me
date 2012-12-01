class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.text :name
      t.integer :age
      t.text :gender
      t.text :city

      t.timestamps
    end
  end
end
