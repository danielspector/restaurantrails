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
    
    freq_array = frequencies.values.sort
    first  = freq_array[-1]
    third  = freq_array[-3]
    second = freq_array[-2]
    top    = [first, second, third]

    i = 2
    next_highest = freq_array[-i - 1]
    binding.pry
    while freq_array[-i] ==  next_highest
      top <<  next_highest
      i += 1
    end

    top.collect do |num|
      frequencies.assoc(frequencies.key(num))
    end
  end
end