# Question 1:
# What's the result of the following:
class Oracle
  def predict_the_future
    "You will " + choices.sample
  end

  def choices
    ["eat a nice lunch", "take a nap soon", "stay at work late"]
  end
end
oracle = Oracle.new
oracle.predict_the_future

# Result/explanation:
# The oracle variable is instantiated to point to a newly created object
#  of the Oracle class. Subsequently, the predict_the_future instance method
#  is invoked on the oracle object, which will return the concatenation of the
#   string object "You will " and the return value of invoking the sample method
#   on the return value of the choices instance method. The choices instance
#   method returns an array containing 3 different String objects. So, the return
#   value of oracle.predict_the_future could be any of the following:
#     "You will eat a nice lunch"
#     "You will take a nap soon"
#     "You will stay at work late"

# Question 2:
# What's the result of:
class Oracle
  def predict_the_future
    "You will " + choices.sample
  end

  def choices
    ["eat a nice lunch", "take a nap soon", "stay at work late"]
  end
end

class RoadTrip < Oracle
  def choices
    ["visit Vegas", "fly to Fiji", "romp in Rome"]
  end
end

trip = RoadTrip.new
trip.predict_the_future

# Result/explanation:
# The RoadTrip class inherits from Oracle, but has its own choices
#   instance method defined, which overrides the choices instance
#   method of the Oracle superclass. So, the return value of invoking
#   the predict_the_future on an object of the RoadTrip class will be
#   a String object that has concatenated "You will" with one of the
#    3 string objects in the array object that's returned by the choices
#   method within the RoadTrip class:
#     "You will visit Vegas" or "You will fly to Fiji" or "You will romp in Rome"

# Question 3:
# How do you know where Ruby will look for a method when it's called? What
#  is the lookup chain for Orange and HotSauce?
module Taste
  def flavor(flavor)
    puts "#{flavor}"
  end
end

class Orange
  include Taste
end

class HotSauce
  include Taste
end

# Can use the ancestors method to see the lookup path for a class, such as
#  Orange and HotSauce. Methods will be searched for in the first class
#  listed in the lookup path. Ruby will continue to look for the method
#  until it finds it otherwise if it searches all locations in the path
#   and doesn't find it than an exception will be raised.
puts Orange.ancestors
# Lookup path order for the Orange class:
# Orange
# Taste
# Object
# Kernel
# BasicObject

# Question 4:
# Refactor the BeesWax class to remove 2 methods but keep the same functionality
# initial class definition:
class BeesWax
  def initialize(type)
    @type = type
  end

  def type
    @type
  end

  def type=(t)
    @type = t
  end

  def describe_type
    puts "I am a #{@type} of Bees Wax"
  end
end

# refactored:
# Removed the individually defined getter and setter type methods and
#  leveraged Ruby's compact syntax for implementing basic getter and
#  setter methods for instance variables, which is the use of
#   attr_accessor :<instance_variable_name>

class BeesWax
  attr_accessor :type
  def initialize(type)
    @type = type
  end

  def describe_type
    puts "I am a #{@type} of Bees Wax"
  end
end


# Question 5:
# What are the following variables?
excited_dog = "excited dog" # local variable b/c snakecase is being used
@excited_dog = "excited dog" # instance variable denoted by the fact the @ symbol is at the front
@@excited_dog = "excited dog" # class variable denoted by the fact that 2 @ symbols are at the start

# Question 6:
# Which method is a class method? How do you call the class method?
class Television
  def self.manufacturer
    # method logic
  end

  def model
    # method logic
  end
end

# manufacturer is the class method, b/c it's defined with the keyword self
# This class method can be called by invoking it on the Television class name:
Television.manufacturer

# Question 7:
# What is the @@cats_count variable and how does it change?
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

# The @@cats_count variable is a class variable for the Cat class.
#  This class variable is initialized to point to zero, but anytime
#  an instance of the Cat object is instantiated the class variable,
#   @@cats_count, is reassigned to point to return value of adding
#   1 to the integer the @@cats_count variable currently points to.
#   Accordingly, this variable tracks how many Cat instance objects there are.
# This process can be checked with the following:
p Cat.cats_count # => 0
sterling = Cat.new("sphynx")
p Cat.cats_count # => 1
# The cats_count class method returns the @@cat_counts class variable
#  and shows that this class variable was reassigned to a higher integer
#   after the instantiation of a new object of the Cat class.

# Question 8:
# How would a Bingo class inherit the play method from the Game class?
# Add the inheritance syntax (so add < <name of class to inherit from)
class Game
  def play
    "Start the game!"
  end
end

class Bingo < Game
  def rules_of_play
  end
end

# Question 9:
# What would happen if you added a play method to the Bingo class that
#   is inheriting from the Game class?
#  The play method of the Bingo class would override the play method of the
#    Game class. So, whenever the play instance method is invoked on an instance
#    object that belongs to the Bingo class, the logic underlying the play method
#    defined in the Bingo class will be used.

# Question 10:
# What are benefits of using object oriented programming in Ruby?
#  > creates boundaries to protect data
#  > creates a way to think through a desired application by
#    the use of instantiating objects (nouns) and their behaviors (methods defined in classes)
#  > helps with efficiency and flexibility in allowing for different defined
#     behaviors be used repeatedly and shared where needed while still allowing
#      for uniquencess through class inheritance and module mixins
