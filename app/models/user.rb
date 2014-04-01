class User < ActiveRecord::Base
  has_many :user_zipcodes
  has_many :zipcodes, through: :user_zipcodes

  has_many :user_restaurants
  has_many :restaurants, through: :user_restaurants

  has_many :user_cuisines
  has_many :cuisines, through: :user_cuisines

  has_many :user_violations
  has_many :violations, through: :user_violations

  validates_presence_of :name, :email, :location, :facebook_id, :image_url

  has_secure_password validations: false
  
  attr_reader :zipcode_list, :cuisine_list

  def zipcodes_as_a_string
    result = ""
    self.zipcodes.each { |z| result = result + z.zip.to_s + ", " }
    result = result[0,result.length-2] if result.length > 0
    result
  end

  def zipcode_list=(params)
    params.gsub(" ", "").split(",").each do |zip|
      if Zipcode.find_by(zip: zip) && !self.zipcodes.include?(Zipcode.find_by(zip: zip))
        self.zipcodes << Zipcode.find_by(zip: zip)  
      end
    end
  end

  def cuisine_list=(params)
    params.each do |cuisine_id|
      if Cuisine.find_by(id: cuisine_id) && !self.cuisines.include?(id: cuisine_id)
        self.cuisines << Cuisine.find_by(id: cuisine_id)
      end
    end
  end
end
