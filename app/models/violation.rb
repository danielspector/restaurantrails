class Violation < ActiveRecord::Base
  has_many :restaurant_violations
  has_many :restaurants, through: :restaurant_violations

  has_many :user_violations
  has_many :users, through: :user_violations
end