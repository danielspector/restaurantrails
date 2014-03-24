class Zipcode < ActiveRecord::Base
  has_many :restaurants
  has_many :cuisine_zipcodes
  has_many :cuisines, through: :cuisine_zipcodes

  has_many :user_zipcodes
  has_many :users, through: :user_zipcodes

  extend FriendlyId
  friendly_id :zip


  def most_common_vios
    all_vios =  self.restaurants.collect do |r|
                  r.violations
                end.flatten
    
    frequencies = Hash.new(0)
    all_vios.each{|key| frequencies[key] += 1}
    frequencies.sort


    top = [frequencies.sort[0], frequencies.sort[1], frequencies.sort[2]]

    i = 3
    next_highest_freq = frequencies.sort[i + 1][1]
    next_highest_vio = frequencies.sort[i + 1]
    while frequencies.sort[i][1] ==  next_highest_freq
      top <<  next_highest_vio
      i += 1
    end

    top
  end
end