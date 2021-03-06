class Cuisine < ActiveRecord::Base
  has_many :restaurant_cuisines
  has_many :restaurants, through: :restaurant_cuisines

  has_many :cuisine_zipcodes
  has_many :zipcodes, through: :cuisine_zipcodes

  has_many :user_cuisines
  has_many :users, through: :user_cuisines

  extend FriendlyId
  friendly_id :description, use: :slugged

  before_save :slugify

  def bad_restaurants
    self.restaurants.select { |r| r.grade != "A" }
  end

  def slugify
    self.slug = self.slug_arg
  end
  
  def slug_arg
    self.description.downcase.gsub(" ", "-").gsub("/", "-")
  end

end