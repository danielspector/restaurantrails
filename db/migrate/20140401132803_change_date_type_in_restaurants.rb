class ChangeDateTypeInRestaurants < ActiveRecord::Migration
  def change
    rename_column :restaurants, :date, :date_string
    add_column :restaurants, :date, :date
    Restaurant.reset_column_information
    Restaurant.find_each { |r| r.update_attribute(:date, r.date_string) }
    remove_column :restaurants, :date_string
  end
end
