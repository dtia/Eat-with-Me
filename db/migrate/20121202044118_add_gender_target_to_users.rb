class AddGenderTargetToUsers < ActiveRecord::Migration
  def change
    add_column :users, :gender_target, :string
  end
end
