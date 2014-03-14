class CuisineZipcode < ActiveRecord::Base
  belongs_to :cuisine
  belongs_to :zipcode
end