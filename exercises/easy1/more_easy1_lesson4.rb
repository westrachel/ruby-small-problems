# Question 1:
# Which are objects? How could you determine what class they belong to?
#  i. true  
#     > true is an object that belongs to the TrueClass
#  ii. "hello" 
#     > "hello" is an object of the String class
#  iii. [1, 2, 3, "happy days"] 
#     > This is an object that belongs to the Array class
#     > Also, the array object contains objects that belong to the Integer
#           class and the String class
#  iv. 142
#     > 142 is an object that belongs to the Integer class

# If unsure of the class of an object, can call the #class method
# example:
true.class # TrueClass

# Question 2:
# Add the ability for the Car class and Truck class to go_fast
#  using the module Speed. Check if your Car or Truck can
#  subsequently go fast.
module Speed
  def go_fast
    puts "I am a #{self.class} and going super fast!"
  end
end

class Car
  include Speed
  def go_slow
    puts "I am safe and driving slow."
  end
end

class Truck
  include Speed
  def go_very_slow
    puts "I am a heavy truck and like going very slow."
  end
end

# Check Car and Truck objects can go fast by instantiating
#  new objects of each class and invoking the go_fast instance
#  method:
Truck.new.go_fast # => I am a Truck and going super fast!
Car.new.go_fast # => I am a Car and going super fast!
# <=> The expected output is returned in the above 2 lines

# Question 3:
# How is the string printed out from the previous problem including
#  the name of the type of the vehicle being used (Truck or Car)?

# The go_fast method is implemented in the Speed module; Looking at
#  the implementation of this method, it's observed that via string
#  interpolation the class method is called on the object that the go_fast
#  method is invoked on. So, above, when Truck.new.go_fast, was invoked first
#  a new object of the Truck class was instantiated by Truck.new. Second, the
#  go_fast method was invoked on the Truck object, so the class method
#   within the go_fast method was invoked on the Truck object, and returned
#   the class Truck, which was then embedded into the String object that was
#    passed in as an argument to the puts method invocation printed the String
#    object.

# Question 4:
# Create a new instance of the given AngryCat class:
class AngryCat
  def hiss
    puts "Hisssss!!!"
  end
end

# new AngryCat instance object:
AngryCat.new

# Question 5:
# Which of the following classes has an instance variable?
# Pizza has an instance variable (@name), because it has a variable that
#  starts with one @ symbol at the start, which is the marking of an instance
#  variable.
class Fruit
  def initialize(name)
    name = name
  end
end

class Pizza
  def initialize(name)
    @name = name
  end
end

# Question 6:
# What could you add to the class below to access the instance variable?
class Cube
  def initialize(volume)
    @volume = volume
  end
end

# > can add the built-in ruby getter method attr_reader :volume
class Cube
  attr_reader :volume
  def initialize(volume)
    @volume = volume
  end
end
# > or can define a getter method (display_volume)
class Cube
  def initialize(volume)
    @volume = volume
  end
  
  def display_volume
    @volume
  end
end
# > another option is to call instance_variable_get on an instance object
#  of the Cube class and pass in "@volume" as an argument

# Question 7:
# What is the default return value of to_s when invoked on an object? Where
#  could you go to find out if not sure?

# The to_s will default return the name of the class that the object belongs to
#  and a coded version of the object's id. If not sure can instantiate an object
#  of a class and not override the to_s method to see what it would return
#  (or could read Ruby docs)
# Example:
speakers = Cube.new(100)
p speakers.to_s # => "#<Cube:0x00000000022a0ad8>"

# Question 8:
# What does self refer to in the make_one_year_older instance method?
class Cat
  attr_accessor :type, :age

  def initialize(type)
    @type = type
    @age  = 0
  end

  def make_one_year_older
    self.age += 1
  end
end

# self refers to the istance object of the Cat class that the
#   make_one_year_older instance method is invoked on
# For example, if instantiate a new Cat object, crookshanks, and then
#   invoke the make_one_year_older instance variable on this object
#    of the Cat class, then age is invoked on the crookshanks cat object/
#    the same object that make_one_year_older is invoked on.
crookshanks = Cat.new("Half-Kneazle")
p crookshanks.make_one_year_older # => 1

# Question 9:
# In the name of the cats_count method self is used. What does self refer
#  to here?
class Cat
  @@cats_count = 0

  def initialize(type)
    @type = type
    @age  = 0
    @@cats_count += 1
  end

  def self.cats_count
    @@cats_count
  end
end
# self used in a method definition within a class refers to the class itself,
#  so the Cat class is being referenced above. The self.cats_count method is
#   specifically a lass method not an instance method.

# Question 10:
# Create a new instance of the Bag class. What's needed?
class Bag
  def initialize(color, material)
    @color = color
    @material = material
  end
end

# Since no default values are set for the color and material
#  parameters of the initialize instance method, when a new Bag
#   object is instantiated, 2 arguments must be passed into the
#   new method call.

# Creating a new object of the Bag class:
backpack = Bag.new("grey", "canvas")
p backpack # => #<Bag:0x00000000029aab58 @color="grey", @material="canvas">
