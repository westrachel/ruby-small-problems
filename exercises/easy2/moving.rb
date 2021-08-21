# Update the given Person, Cheetah, and Cat class (only can add 1 method) so that the 
#  expected output is printed

# Solution 1: define a mammal superclass that the existing classes inherit from
#   that has an instnace method that can call the private method gait
class Mammal
  attr_reader :name

  def initialize(name)
    @name = name
  end
  
  def walk
    puts "#{@name} #{gait} forward"
  end
  
  private
  
  def gait
    "wiggles"
  end
  
end

class Person < Mammal
  def gait
    "strolls"
  end
end

class Cheetah < Mammal
  def gait
    "runs"
  end
end

class Cat < Mammal
  def gait
    "saunters"
  end
end

mike = Person.new("Mike")
mike.walk
# => "Mike strolls forward"

kitty = Cat.new("Kitty")
kitty.walk
# => "Kitty saunters forward"

flash = Cheetah.new("Flash")
flash.walk
# => "Flash runs forward"


# Solution 2: create a module
module Moveable
  def walk
    "#{@name} " + gait + " forward"
  end
end

class Person
  attr_reader :name
  include Movement

  def initialize(name)
    @name = name
  end

  private

  def gait
    "strolls"
  end
end

class Cat
  attr_reader :name
  include Movement

  def initialize(name)
    @name = name
  end

  private

  def gait
    "saunters"
  end
end

class Cheetah
  attr_reader :name
  include Movement

  def initialize(name)
    @name = name
  end

  private

  def gait
    "runs"
  end
end

mike = Person.new("Mike")
mike.walk
# => "Mike strolls forward"

kitty = Cat.new("Kitty")
kitty.walk
# => "Kitty saunters forward"

flash = Cheetah.new("Flash")
flash.walk
# => "Flash runs forward"
