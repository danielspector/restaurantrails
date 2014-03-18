class UserZipcode < ActiveRecord::Base
  belongs_to :user
  belongs_to :zipcode
end