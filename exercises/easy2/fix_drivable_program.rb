# Make the smallest change such that cars will have access to the drive method

module Drivable
 # def self.drive <=> remove self from the definition
  def drive
  end
end

class Car
  include Drivable
end

bobs_car = Car.new
bobs_car.drive
