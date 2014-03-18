class CreateUserZipcodes < ActiveRecord::Migration
  def change
    create_table :user_zipcodes do |t|
      t.integer :user_id
      t.integer :zipcode_id
    end
  end
end
