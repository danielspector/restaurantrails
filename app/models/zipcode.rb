class Zipcode < ActiveRecord::Base
  has_many :restaurants
  has_many :cuisine_zipcodes
  has_many :cuisines, through: :cuisine_zipcodes

  has_many :user_zipcodes
  has_many :users, through: :user_zipcodes

  extend FriendlyId
  friendly_id :zip
end