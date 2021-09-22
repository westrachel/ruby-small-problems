# Part 1: Why does the following raise an exception?

# The SongBird class includes an initialize method that's defined with
#  3 different parameters. Within the initialize method, the super keyword
#  is included which will invoke the initialize method of the superclass of
#  SongBird, which is Bird. Bird inherits from Animal and doesn't override
#  Animal's initialize method, so it's the initialize method within Animal that
#  is being called within the SongBird's initialize method. The initialize
#  method of Animal expects 2 arguments: diet and superpower. When super is referenced
#  within SongBird's initialize method, no arguments are specified. There are 3 arguments
#  that are passed into the SongBird's initialize method, but they can't all be passed
#  into the initialize method of Animal. As a result, an incorrect number of arguments
#  exception is raised.

# The program could be fixed if super was replaced with super(diet, superpower) within
#  the SongBird's initialize method, so that only 2 arguments are clearly passed into
#  the Animal's initialize method.

# Part 2: Is the FlightlessBird#initialize method necessary?
# No, because it's not additive relative to the Animal's initialize method.
#  FlightlessBird inherits from Bird, which inherits from Animal. So, if the
#  initialize method was removed from FlightlessBird, it's initializition wouldn't be
#  affected. However, if additional instance variables specific to the FlightlessBird
#  class are going to be added to the program and instantiated upon initialization, then that
#  would be grounds for keeping the initialize method for this class.

class Animal
  def initialize(diet, superpower)
    @diet = diet
    @superpower = superpower
  end

  def move
    puts "I'm moving!"
  end

  def superpower
    puts "I can #{@superpower}!"
  end
end

class Fish < Animal
  def move
    puts "I'm swimming!"
  end
end

class Bird < Animal
end

class FlightlessBird < Bird
  def initialize(diet, superpower)
    super
  end

  def move
    puts "I'm running!"
  end
end

class SongBird < Bird
  def initialize(diet, superpower, song)
    super
    @song = song
  end

  def move
    puts "I'm flying!"
  end
end

# Examples

unicornfish = Fish.new(:herbivore, 'breathe underwater')
penguin = FlightlessBird.new(:carnivore, 'drink sea water')
robin = SongBird.new(:omnivore, 'sing', 'chirp chirrr chirp chirp chirrrr')