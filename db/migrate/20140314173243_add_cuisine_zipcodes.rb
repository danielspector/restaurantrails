class AddCuisineZipcodes < ActiveRecord::Migration
  def change
    create_table :cuisine_zipcodes do |t|
      t.integer :cuisine_id
      t.integer :zipcode_id
    end
  end
end
