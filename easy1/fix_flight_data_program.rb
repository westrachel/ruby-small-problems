# Given the Flight class definition, how would you alter it to avoid future issues if
#   the database is no longer used and the implementation is altered

class Flight
  attr_accessor :database_handle

  def initialize(flight_number)
    @database_handle = Database.init
    @flight_number = flight_number
  end
end

# Notes:
# The getter/setter methods for the @database_handle instance variable could be removed,
#   so that they're not used and there's no active code/no active Flight objects dependent on that 
#   that might create issues for removing/althering the implementation of the database in the future.
