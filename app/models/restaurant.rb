class Restaurant < ActiveRecord::Base
  has_many :restaurant_violations
  has_many :violations, through: :restaurant_violations
  has_many :restaurant_cuisines
  has_many :cuisines, through: :restaurant_cuisines

  def phone_num
    self.phone.to_s.strip.split('').insert(3, "-").insert(7, "-").join()
  end

  def self.zip_list(zip_code)
    Restaurant.where(zip: zip_code)
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
