# Part 1: Create 2 instances of teh given cat with separate names and ages
class AngryCat
  def initialize(age, name)
    @age  = age
    @name = name
  end

  def age
    puts @age
  end

  def name
    puts @name
  end

  def hiss
    puts "Hisssss!!!"
  end
end

# Creating 2 new cat object instances:
siamese = AngryCat.new(2, "Sam")
sphynx = AngryCat.new(4, "Boo")

# Part 2: Given the Cat class, how could you alter
#   to_s so that the output returned is "I am a <type> of cat"
#   instead of the default to_s return of the Class name and a coded cat
#    object id.
class Cat
  attr_reader :type # add a getter method for the type instance variable
  
  def initialize(type)
    @type = type
  end
  
  def to_s # override the default inherited to_s method to create the desired custom return value
    "I am a #{type} cat"
  end
end

sam = Cat.new("siamese")
p sam.to_s # => I am a siamese cat

# Part 3:
# rewrite the make_one_year_older method w/o using self.
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

# rewritten:
class Cat
  attr_accessor :type, :age

  def initialize(type)
    @type = type
    @age  = 0
  end

  def make_one_year_older
    @age += 1
  end
end
