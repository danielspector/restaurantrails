class Zipcode < ActiveRecord::Base
  has_many :restaurants
  has_many :cuisine_zipcodes
  has_many :cuisines, through: :cuisine_zipcodes

  extend FriendlyId
  friendly_id :description
end