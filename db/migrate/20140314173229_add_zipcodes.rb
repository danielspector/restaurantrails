class AddZipcodes < ActiveRecord::Migration
  def change
    create_table :zipcodes do |t|
      t.string :zip
    end
  end
end
