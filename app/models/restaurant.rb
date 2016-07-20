class Restaurant < ActiveRecord::Base

  geocoded_by :full_address
  after_validation :geocode

  def full_address
    result = address
    result += " #{city}" if city
    result += " #{state}" if state
    result += " #{zip}" if zip
    return result
  end
end
