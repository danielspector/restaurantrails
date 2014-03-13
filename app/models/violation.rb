class Violation < ActiveRecord::Base
  has_many :restaurant_violations
  has_many :restaurants, through: :restaurant_violations
  
  def self.seed
    f = File.new("./textfiles/Violation.txt", 'r')
    f.gets
    while line = f.gets
      components = line.force_encoding('ISO-8859-1').encode('utf-8', replace: nil).gsub(/<\/?.*?>/, "").gsub("\"", " ").split(" , ") # .gsub(/<.+>/, "")
      if Violation.exists?(vio_code: components[3])
        v = Violation.find_by(vio_code: components[3])
        v.description = components[4]
        v.save
        next
      end
      # next if Violation.find_by vio_code: components[3] != nil
      v = Violation.create
      components[2] == "Y" ? v.critical_vio = true : v.critical_vio = false
      v.vio_code = components[3]
      v.description = components[4]
      v.save
    end
    f.close
  end
end