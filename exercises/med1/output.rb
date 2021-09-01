# (1) object inheritance to update message printing
# Create Hello and Goodbye classes that inherit from a Greeting
#  class and use the Greeting class's greet instance method to 
#  print out different messages.

class Greeting
  def greet(string)
    puts string
  end
end

class Hello < Greeting
  def hi
    greet("Hello World!")
  end
end

class Goodbye < Greeting
  def bye
    greet("Goodbye World!")
  end
end

Hello.new.hi # => Hello World!
Goodbye.new.bye # => Goodbye World!

# (2) instance method definition to achieve messaging
# Update the given KrispyKreme class to meet the expected behavior
# initial:
#class KrispyKreme
#  def initialize(filling_type, glazing)
#    @filling_type = filling_type
#    @glazing = glazing
#  end
#end

# Assumptions behind the following edits:
#   > reassigning the instance variables upon initialization if there are nils to
#      the default type, Plain (for both filling type and glazing)
#   > the puts method calls to_s when an array isn't the argument passed in, so
#      defining a custom to_s instance method for the KrispyKreme class to print
#      the desired messages
#   > this strategy is altering the inputs; alternatively, could have left the instance
#      variables' values as they are and changed the conditional logic in the to_s definition

class KrispyKreme
  def initialize(filling_type, glazing)
    filling_type.nil? ? @filling_type = "Plain" : @filling_type = filling_type
    glazing.nil? ? @glazing = "Plain" : @glazing = glazing
  end

  def to_s
    if @glazing == "Plain"
      puts " => #{@filling_type}"
    else
      puts " => #{@filling_type} with #{@glazing}"
    end
  end
end

donut1 = KrispyKreme.new(nil, nil)
donut2 = KrispyKreme.new("Vanilla", nil)
donut3 = KrispyKreme.new(nil, "sugar")
donut4 = KrispyKreme.new(nil, "chocolate sprinkles")
donut5 = KrispyKreme.new("Custard", "icing")

puts donut1
#  => "Plain"

puts donut2
#  => "Vanilla"

puts donut3
#  => "Plain with sugar"

puts donut4
#  => "Plain with chocolate sprinkles"

puts donut5
#  => "Custard with icing"
