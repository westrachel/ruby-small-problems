# Part 1:
# Compare the 2 different Computer classes below
class Computer
  attr_accessor :template

  def create_template
    @template = "template 14231"
  end

  def show_template
    template
  end
end

class Computer
  attr_accessor :template
  def create_template
    self.template = "template 14231"
  end

  def show_template
    self.template
  end
end

comp = Computer.new
p comp.show_template

# Answer:
# > Both Computer classes have getter/setter methods for the template
#    instance variable as established by the attr_accessor :template line.
# > The create_template instance methods in both classes will achieve the same
#   result, as self.template and @template in the case of these instance methods
#   can be used interchangeably.
# > The first Computer class references the getter method for template in the
#    show_template instance method without using the keyword self. Since both classes'
#    show_template instance methods will achieve the same result, it's observed that
#    the use of the self keyword isn't necessary in the second class.

# Part 2:
# What would you change the instance method name below to in order to be more clear and
#   less repetitive?
class Light
  attr_accessor :brightness, :color

  def initialize(brightness, color)
    @brightness = brightness
    @color = color
  end

  def light_status
    "I have a brightness level of #{brightness} and a color of #{color}"
  end

end

# I would change it to description, since when I think of status in terms of lighting, I think
#  of whether the lgiht is on or off, which is captured by the brightness aspect. Technically,
#  I could leave the status aspect as is, since status and description generally are getting
#  at the same thing. The main point of this change to description is to remove the "light_"
#  part of the instance method. With this change, if a new Light object, say light1
#  is created, and the instance method is called on it, then instead of invoking
#  light1.light_status, I would invoke light1.description, which I think is clearer/less
#  repetitive.
