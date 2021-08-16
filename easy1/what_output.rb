class Pet
  attr_reader :name

  def initialize(name)
    @name = name.to_s
  end

  def to_s
    @name.upcase!
    "My name is #{@name}."
  end
end

name = 'Fluffy'
fluffy = Pet.new(name)
puts fluffy.name #Fluffy
puts fluffy #My name is FLUFFY.
puts fluffy.name #FLUFFY
puts name #FLUFFY

# modified class that won't mutate @name
class Pet
  attr_reader :name

  def initialize(name)
    @name = name.to_s
  end

  def to_s
    "My name is #{@name.upcase}."
  end
end

name = 'Fluffy'
fluffy = Pet.new(name)
puts fluffy.name #Fluffy
puts fluffy #My name is FLUFFY.
puts fluffy.name #Fluffy
puts name #Fluffy

# Further Exploration:
name = 42
fluffy = Pet.new(name)
name += 1
puts fluffy.name # 42
puts fluffy # My name is 42
puts fluffy.name # 42
puts name # 43

# Explain the above:
# The local variable name is assigned to point to the integer 42. fluffy is initialized
#  as a pet object with the integer 42 passed in as an argument to the initialize method. 
# The local variable name is reassigned to point to the integer 43, so it no longer points
#  to the same integer as the name instance variable for the fluffy Pet object.
# Accordingly, it's observed that when the getter method is used to print the name of fluffy,
#   42 is returned instead of 43.
# When the to_s method is called, the Pet class is looked up first for a definition, and the
#   lookup path will only inspect the Pet class method since there is a specific to_s definition for
#   this class. The to_s method defined in the Pet class uses string interpolation to embed the
#    uppercased version of the string object the instance variable name points to into the string
#     "My name is "


# If to_s wasn't included in the Pet class's initialize method definition then upcase would be
#   called on an integer in the above code, which would raise an exception.