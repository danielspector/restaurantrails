class Violation < ActiveRecord::Base
  has_many :restaurant_violations
  has_many :restaurants, through: :restaurant_violations

  has_many :user_violations
  has_many :users, through: :user_violations

  def critical?
    self.critical_vio
  end

  def self.most_common
    frequency_sort = Violation.all.sort! { |a,b| a.restaurants.length <=> b.restaurants.length }
    first = frequency_sort[-1]
    second = frequency_sort[-2]
    third = frequency_sort[-3]
    
    top = [first, second, third]
    i = 2
    while frequency_sort[-i].restaurants.length == frequency_sort[-i - 1].restaurants.length && frequency_sort[-i].restaurants.length != 0
      top << frequency_sort[-i - 1]
      i += 1
    end
    top
  end
end

