# Part 1:
# Change the shared behavior structure from class inheritance to modules so that
#  the Catamaran, Auto, and Motorcycle classes can mixin the created module to
#  track fuel efficiency range

# notes:
# > extract the range method to the module
# > also, can extract the common setters and getters to the module

module Mobile
  attr_accessor :speed, :heading
  attr_writer :fuel_capacity, :fuel_efficiency

  def range
    @fuel_capacity * @fuel_efficiency
  end
end

class WheeledVehicle
  include Mobile
  
  def initialize(tire_array, km_traveled_per_liter, liters_of_fuel_capacity)
    @tires = tire_array
    self.fuel_efficiency = km_traveled_per_liter
    self.fuel_capacity = liters_of_fuel_capacity
  end

  def tire_pressure(tire_index)
    @tires[tire_index]
  end

  def inflate_tire(tire_index, pressure)
    @tires[tire_index] = pressure
  end

end

class Auto < WheeledVehicle
  def initialize
    # 4 tires are various tire pressures
    super([30,30,32,32], 50, 25.0)
  end
end

class Motorcycle < WheeledVehicle
  def initialize
    # 2 tires are various tire pressures
    super([20,20], 80, 8.0)
  end
end

#class Catamaran
#  attr_reader :propeller_count, :hull_count
#  include Mobile

#  def initialize(num_propellers, num_hulls, km_traveled_per_liter, liters_of_fuel_capacity)
#    @propeller_count = num_propellers
#    @hull_count = num_hulls
#    self.fuel_efficiency = km_traveled_per_liter
#    self.fuel_capacity = liters_of_fuel_capacity
#  end
#end

# Part 2:
# Incorporate a Motorboat class
#   > motorboats have a single propeller and hull, but behaves similar to a catamaran otherwise

# Options:
#  i. Can create a separate WaterVehicle class that both Catamaran and Motorboat inherit from
#    <=> this would be more noticeably beneficial if had more functionality defined that's common
#     to both the Catamaran and Motorboat class, so that there would be efficiency gains from extracting
#     out the common code to a superclass. There is some overlap between Catamaran and Motorboat though,
#     which would support utilizing class inheritance.
#  ii. Can simply define a new motorboat class that has constants that define the number of propellers
#      and hulls as 1 or just set those as the values as the default entries for the instance variables
#      num_propellers and num_hulls; this does repeat logic that Catamaran has and does, so adding class
#       inheritance from a WaterVehicle (option 1) seems like the way to go.

# Option 1:
class WaterVehicle
  include Mobile
  attr_reader :propeller_count, :hull_count

  def initialize(num_propellers, num_hulls, km_traveled_per_liter, liters_of_fuel_capacity)
    @propeller_count = num_propellers
    @hull_count = num_hulls
    self.fuel_efficiency = km_traveled_per_liter
    self.fuel_capacity = liters_of_fuel_capacity
  end
end

class Catamaran < WaterVehicle
end

class Motorboat < WaterVehicle
  def initialize(km_traveled_per_liter, liters_of_fuel_capacity)
    super(1, 1, km_traveled_per_liter, liters_of_fuel_capacity)
  end
end

# Part 3:
# Modify as necessary, so that the range method's calculation is the same for
#  wheeled vehicles, but for catamaran and motorboat objects, the range method
#   returns an additional 10km b/c of the currents

# Options:
#  i. Can add conditional logic to the range method in the Mobile module that
#    checks what class of object the calling object is and if it's a Catamaran or
#    a Motorboat, then it adds 10 to the range
#  ii. Can override the inherited range instance method by adding a range method into
#     the superclass, WaterVehicles, that has the slightly modified range formula

# Override the range method for specific water vehicle class/subclass objects:
class WaterVehicle
  include Mobile
  attr_reader :propeller_count, :hull_count

  def initialize(num_propellers, num_hulls, km_traveled_per_liter, liters_of_fuel_capacity)
    @propeller_count = num_propellers
    @hull_count = num_hulls
    self.fuel_efficiency = km_traveled_per_liter
    self.fuel_capacity = liters_of_fuel_capacity
  end
  
  def range
    super + 10 # add 10 km to the value returned by the range formula defined in the Mobile module
  end
end
