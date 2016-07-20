class Restaurant < ActiveRecord::Base

  geocoded_by :full_address
  after_validation :geocode

  def self.search(client_address)
    distances = {}
    client_latitude, client_longitude = Geocoder.coordinates(client_address)
  end

  def full_address
    result = address
    result += " #{city}" if city
    result += " #{state}" if state
    result += " #{zip}" if zip
    return result
  end

  def distance(location1 , location2)
   # using the Haversine Formula to calculate distances between 2 points on a shpere
   # see http://andrew.hedges.name/experiments/haversine/ for more info
   lat1 = location1[0]
   lat2 = location2[0]
   lon1 = location1[1]
   lon2 = location2[1]

   dlon = lon2 - lon1
   dlat = lat2 - lat1
   puts "#{dlon} #{dlat}"

   a = (Math.sin(rpd(dlat)/2))**2 + Math.cos(rpd(lat1)) * Math.cos(rpd(lat2)) *(Math.sin(rpd(dlon)/2))**2
   c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a))
   # constant radius of the earth in miles 
   d = 3959 * c
   return d
  end

  def rpd(num)
    return num * (Math::PI / 180)
  end
  

end
