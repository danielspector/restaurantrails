VALID_LETTERS = ["B","C","Z"]

# # ------------------ RESTAURANT
# Restaurant.delete_all
# f = File.new("./app/public/textfiles/WebExtract.txt", 'r')
# f.gets
# while line = f.gets
#   components = line.force_encoding('ISO-8859-1').encode('utf-8', replace: nil).gsub("\"", "").split(",")
#   begin
#     d = Date.iso8601(components[8].split(" ")[0])
#     r = Restaurant.find_by(phone: components[6].to_i)
#     if r != nil
#       if r.date < d.to_s
#         if !VALID_LETTERS.include?(components[12])
#           r.destroy
#         else
#           r.date = d.to_s
#           r.save
#         end
#       end
#       next
#     end
#   rescue
#     next
#   end

#   next if (Date.today - d) > 200
#   next if !VALID_LETTERS.include?(components[12])
#   next if components[5].length != 5
#   r = Restaurant.new
#   r.name = components[1].downcase.titleize
#   r.building_number = components[3].to_i
#   r.street_name = components[4].downcase.titleize
#   r.zip = components[5].to_i
#   r.phone = components[6].to_i
#   r.cuisinecode = components[7].to_i
#   r.date = d.to_s
#   r.score = components[11].to_i
#   r.grade = components[12]
#   r.save
# end
# f.close


# # ------------------ CUISINE
# Cuisine.delete_all
# f = File.new("./app/public/textfiles/Cuisine.txt", 'r')
# f.gets
# while line = f.gets
#   components = line.force_encoding('ISO-8859-1').encode('utf-8', replace: nil).gsub(/<\/?.*?>/, "").gsub("\"", "").split(",") # .gsub(/<.+>/, "")
#   next if !Restaurant.exists?(cuisinecode: components[0])
#   # next if Violation.find_by vio_code: components[3] != nil
#   c = Cuisine.new
#   c.cuisinecode = components[0]
#   c.description = components[1].gsub("\r\n", "")
#   c.save
# end
# f.close

# ------------------ VIOLATIONS

# Violation.delete_all
# f = File.new("./app/public/textfiles/Violation.txt", 'r')
# f.gets
# f.each_line do |line|
#   components = line.force_encoding('ISO-8859-1').encode('utf-8', replace: nil).gsub(/<\/?.*?>/, "").gsub("\"", " ").split(" , ") # .gsub(/<.+>/, "")
#   if Violation.exists?(vio_code: components[3])
#     v = Violation.find_by(vio_code: components[3])
#     v.description = components[4]
#     v.save
#     next
#   end
#   next if Violation.find_by vio_code: components[3] != nil
#   v = Violation.new
#   components[2] == "Y" ? v.critical_vio = true : v.critical_vio = false
#   v.vio_code = components[3]
#   v.description = components[4]
#   v.end_date = components[1]
#   v.save
# end
# f.close

# ------------------ RESTAURANTCUISINE
# RestaurantCuisine.delete_all
# f = File.new("./app/public/textfiles/WebExtract.txt", 'r')
# f.gets
# f.each_line do |line|
#   components = line.force_encoding('ISO-8859-1').encode('utf-8', replace: nil).gsub("\"", "").split(",")
#   next if !Restaurant.exists?(phone: components[6])
#   next if !Cuisine.exists?(cuisinecode: components[7])
#   next if RestaurantCuisine.exists?(restaurant_id: Restaurant.find_by(phone: components[6]).id)
#   join = RestaurantCuisine.new
#   join.restaurant_id = Restaurant.find_by(phone: components[6]).id 
#   join.cuisine_id = Cuisine.find_by(cuisinecode: components[7]).id 
#   join.save
# end
# f.close

# ------------------ RESTAURANTVIOLATION
# RestaurantViolation.delete_all

# f = File.new("./app/public/textfiles/WebExtract.txt", 'r')
# f.each_line do |line|

#   components = line.force_encoding('ISO-8859-1').encode('utf-8', replace: nil).gsub("\"", "").split(",")
#   begin
#     d = Date.iso8601(components[8].split(" ")[0])
#     r = Restaurant.find_by(phone: components[6].to_i)
#     if r != nil
#       next if r.date != d.to_s
#     else
#       next
#     end
#   rescue
#     next
#   end
#   next if (Date.today - d) > 200      

#   next if !Violation.exists?(vio_code: components[10])
#   rv_array = RestaurantViolation.where(restaurant_id: Restaurant.find_by(phone: components[6]).id)
#   found_dupe = false
#   rv_array.each do |rv|
#     found_dupe = true if rv.violation_id == Violation.find_by(vio_code: components[10]).id
#   end
#   next if found_dupe

#   join = RestaurantViolation.new
#   join.restaurant_id = Restaurant.find_by(phone: components[6]).id 
#   join.violation_id = Violation.find_by(vio_code: components[10]).id 
#   join.save

# end
# f.close


# ------------------ ZIPCODES
# Zipcode.delete_all
# Restaurant.all_zips.each do |z|
#   a = Zipcode.find_or_create_by(zip: z)
#   a.save
# end


# ------------------ CUISINEZIPCODES
# CuisineZipcode.delete_all
# Zipcode.all.each do |zip|
#   zip.restaurants.each do |r|
#     zip.cuisine_zipcodes.build(cuisine: r.cuisines[0] )
#   end
# end

# ------------------ SEED ZIPCODE ID FOR RESTAURANTS
# Restaurant.all.each do |r|
#   z = Zipcode.find_by(zip: r.zip)
#   r.zipcode_id = z.id
#   r.save
# end
