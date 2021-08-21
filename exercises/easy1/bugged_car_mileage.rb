# Edit the following so that 5678 is printed by the last puts call:
class Car
  attr_accessor :mileage

  def initialize
    @mileage = 0
  end

  def increment_mileage(miles)
    total = mileage + miles 
    # mileage = total 
    # the above line is what's causing the issue as it's initializing a new mileage local varaible that points to the
    #   same integer that the total local variable points to
    @mileage = total # need to reassign the @mileage instance variable to total
  end

  def print_mileage
    puts mileage
  end
end

car = Car.new
car.mileage = 5000
car.increment_mileage(678)
car.print_mileage  # should print 5678, but originally prints 5000
# => 5678

# Additional notes:
# Instead of referencing @mileage, the instance variable, may be better to reference the setter method
#   through using self.mileage = total; in the above simple class, it doesn't matter, but if had a unique
#   setter method definition that performed checks on mileage referring to the setter method to reassign
#   the integer the instance variable points to would ensure these checks happen.