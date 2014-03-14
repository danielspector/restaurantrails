class Cuisine < ActiveRecord::Base
  has_many :restaurant_cuisines
  has_many :restaurants, through: :restaurant_cuisines

  extend FriendlyId
  friendly_id :description, use: :slugged

  before_save :slugify

  def slugify
    self.slug = self.slug_arg
  end
  
  def slug_arg
    self.description.downcase.gsub(" ", "-")
  end

end