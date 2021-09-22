class Person
  attr_reader :name
  attr_accessor :location

  def initialize(name)
    @name = name
  end

  def teleport_to(latitude, longitude)
    @location = GeoLocation.new(latitude, longitude)
  end
end

class GeoLocation
  attr_reader :latitude, :longitude

  def initialize(latitude, longitude)
    @latitude = latitude
    @longitude = longitude
  end

  def to_s
    "(#{latitude}, #{longitude})"
  end
end

# Example

ada = Person.new('Ada')
ada.location = GeoLocation.new(53.477, -2.236)

grace = Person.new('Grace')
grace.location = GeoLocation.new(-33.89, 151.277)

ada.teleport_to(-33.89, 151.277)

puts ada.location                   # (-33.89, 151.277)
puts grace.location                 # (-33.89, 151.277)
puts ada.location == grace.location # expected: true
                                    # actual: false

# Why is the actual output false when the coordinates are the same?
#  The return values of ada.location and grace.location are two unique GeoLocation
#   instance objects. The latitude and longitude instance variables of these 2 unique
#   GeoLocation objects point to the same factor numerical coordinate values. Therefore,
#   if want to print out true, then need to compare just the specific instance variable
#   attributes that are the same across the objects (alternatively, could create a specific
#   == instance method for the GeoLocation class that compares these specific attributes)
puts ada.location.latitude == grace.location.latitude
# => true
puts ada.location.longitude == grace.location.longitude
# => true