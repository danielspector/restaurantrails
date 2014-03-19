class User < ActiveRecord::Base
  has_many :user_zipcodes
  has_many :zipcodes, through: :user_zipcodes

  has_many :user_restaurants
  has_many :restaurants, through: :user_restaurants

  has_many :user_cuisines
  has_many :cuisines, through: :user_cuisines

  has_many :user_violations
  has_many :violations, through: :user_violations

  has_secure_password

  validates_presence_of :name, :email, :password, :password_confirmation
  validates_uniqueness_of :email
  
  attr_reader :zipcode_list, :cuisine_list, :restaurant_list

  def zipcode_list=(params)
    params.gsub(" ", "").split(",").each do |zip|
      if Zipcode.find_by(zip: zip) && !self.zipcodes.include?(Zipcode.find_by(zip: zip))
        self.zipcodes << Zipcode.find_by(zip: zip)  
      end
    end
  end

  def cuisine_list=(params)
    params.each do |cuisine_id|
      if Cuisine.find_by(id: cuisine_id) && !self.cuisines.include?(id: cuisine_id))
        self.cuisines << Cuisine.find_by(id: cuisine_id)
      end
    end
  end

  def restaurant_list=(params)
    params.gsub(" ", "").split(",").each do |restaurant|
      if Restaurant.find_by(name: restaurant) && !self.restaurants.include?(Restaurant.find_by(name: restaurant))
        self.restaurants << Restaurant.find_by(name: restaurant)
      end
    end
  end
end
