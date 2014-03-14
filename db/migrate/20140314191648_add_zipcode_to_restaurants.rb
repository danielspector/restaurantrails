class AddZipcodeToRestaurants < ActiveRecord::Migration
  def change
    add_column :restaurants, :zipcode_id, :integer
  end
end
