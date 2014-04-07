class Violation < ActiveRecord::Base
  has_many :restaurant_violations
  has_many :restaurants, through: :restaurant_violations

  has_many :user_violations
  has_many :users, through: :user_violations

  def critical?
    self.critical_vio
  end

  def self.most_common
    self.joins(:restaurants).group("violations.id").order("count(restaurant_violations.violation_id) desc").limit(3)
  end

  def short_desc
    "#{self.description.slice(0..60)}..."
  end
end

