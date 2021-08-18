# Refactor vehicles so that all classes inherit behavior (where applicable) from one superclass

#class Car
#  attr_reader :make, :model
#
#  def initialize(make, model)
#    @make = make
#    @model = model
#  end
#
#  def wheels
#    4
#  end
#
#  def to_s
#    "#{make} #{model}"
#  end
#end
#
#class Motorcycle
#  attr_reader :make, :model
#
#  def initialize(make, model)
#    @make = make
#    @model = model
#  end
#
#  def wheels
#    2
#  end
#
#  def to_s
#    "#{make} #{model}"
#  end
#end
#
#class Truck
#  attr_reader :make, :model, :payload
#
#  def initialize(make, model, payload)
#    @make = make
#    @model = model
#    @payload = payload
#  end
#
#  def wheels
#    6
#  end
#
#  def to_s
#    "#{make} #{model}"
#  end
#end

# Refactored version:
class Vehicle
  attr_reader :make, :model

  def initialize(make, model)
    @make = make
    @model = model
  end

  def wheels
    4
  end

  def to_s
    "#{make} #{model}"
  end
end

class Motorcycle < Vehicle
  def wheels
    super / 2
  end
end

class Truck < Vehicle
  attr_reader :payload

  def initialize(make, model, payload)
    super(make, model)
    @payload = payload
  end
  def wheels
    super + 2
  end
end

transformer = Truck.new("bumblebee", 1984, 2000)
puts transformer.payload # 2000
puts transformer.make # bumblebee
puts transformer.model # 1984
puts transformer.wheels # 6
