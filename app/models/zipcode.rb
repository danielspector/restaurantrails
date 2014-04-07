class Zipcode < ActiveRecord::Base
  has_many :restaurants
  has_many :cuisine_zipcodes
  has_many :cuisines, through: :cuisine_zipcodes

  has_many :user_zipcodes
  has_many :users, through: :user_zipcodes

  extend FriendlyId
  friendly_id :zip

  def bad_restaurants
    self.restaurants.select { |r| r.grade != "A" }
  end

  def most_common_vios
    Violation.joins(:restaurants).group("violations.id, restaurants.zipcode_id").order("count(restaurant_violations.violation_id) desc").having("restaurants.zipcode_id = ?", self.id).limit(3)
  end
end