# What happens when the methods below are called:
class Television
  def self.manufacturer
    # method logic
  end

  def model
    # method logic
  end
end

tv = Television.new
tv.manufacturer # Undefined method exception is raised
#  b/c manufacturer is a class method and one cannot
#   invoke a class method on an instance object of the class,
#   which is what tv is
tv.model # the return value of the instance method, model, will
#  be returned

Television.manufacturer # the return value of the class method,
#  manufacturer is returned
Television.model # Undefined method exception is raised b/c
#  one cannot call an instance method, which is model is, on
#  a Class. Television doesn't inherit in the above from a superclass
#  that has a model class method, so an undefined exception is raised here.

# What has no added value below?
class Light
  attr_accessor :brightness, :color

  def initialize(brightness, color)
    @brightness = brightness
    @color = color
  end

  def self.information
    return "I want to turn on the light with a brightness level of super high and a color of green"
  end

end
# The use of the return keyword is redundant, because the self.information class
#  method only has 1 line and Ruby will return the value of the last line executed.
