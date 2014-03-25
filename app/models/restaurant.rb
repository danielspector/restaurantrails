class Restaurant < ActiveRecord::Base
  has_many :restaurant_violations
  has_many :violations, through: :restaurant_violations
  
  has_many :restaurant_cuisines
  has_many :cuisines, through: :restaurant_cuisines

  has_many :user_restaurants
  has_many :users, through: :user_restaurants

  belongs_to :zipcode

  extend FriendlyId
  friendly_id :name, use: :slugged

  # before_save :slugify

  def zipify
    self.zipcode_id = self.ziparg
    self.save
  end
  
  def ziparg
    Zipcode.find_by(zip: self.zip).id
  end

  def slugify
    self.slug = self.slug_arg
  end
  
  def slug_arg
    # puts "name: #{name}"
    self.name.downcase.gsub(" ", "-").gsub("/", "-")
  end


  def phone_num
    self.phone.to_s.strip.split('').insert(3, "-").insert(7, "-").join()[0,12]
  end

  def self.zip_list(zip_code)
    Restaurant.where(zip: zip_code)
  end

  def self.all_zips
    self.all.collect do |r|
      r.zip
    end.uniq
  end

  def address
    @address = "#{self.building_number} #{self.street_name}, #{self.zip}"
    @address
  end

  def self.worst_restaurant_in_zip(zip_code, num=1)
    r = Restaurant.zip_list(zip_code).sort do |a,b|
      if a.score == nil
        1
      elsif b.score == nil
        -1
      else
        b.score <=> a.score
      end
    end

    if num == 1
      r.first
    else
      r[0,num]
    end
  end
end
