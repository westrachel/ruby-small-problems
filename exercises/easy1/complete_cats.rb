# Edit the Cat class so that the following to achieve the intended output:
# My cat Pudding is 7 years old and has black and white fur.
# My cat Butterscotch is 10 years old and has tan and white fur.

class Pet
  def initialize(name, age)
    @name = name
    @age = age
  end
end

# solution:
class Cat < Pet
  def initialize(name, age, color)
    super(name, age)
    @color = color
  end
  def to_s
    "My cat #{@name} is #{@age} years old and has #{@color} fur."
  end
end

pudding = Cat.new('Pudding', 7, 'black and white')
butterscotch = Cat.new('Butterscotch', 10, 'tan and white')
puts pudding, butterscotch
# => My cat Pudding is 7 years old and has black and white fur.
# => My cat Butterscotch is 10 years old and has tan and white fur.

# Further Exploration:
# Alternatively to the above solution, could have changed the Pet's initialize method,
#  which may be an alright solution, but some pets might not care to have a @color instance
#  variable that keeps track of its color. For example, if live on a farm and have a pet cow, there 
#  wouldn't be a need for a @color instance variable. If decided to change Pet's initialize method, could
#  set the default argument as "not applicable", so that for pets where a @color instance variable
#  doesn't matter, a value doesn't have to be passed in on initialization.

class Pet
  def initialize(name, age, color="not applicable")
    @name = name
    @age = age
    @color = color
  end
end

# solution:
class Cat < Pet
  def to_s
    "My cat #{@name} is #{@age} years old and has #{@color} fur."
  end
end

pudding = Cat.new('Pudding', 7, 'black and white')
butterscotch = Cat.new('Butterscotch', 10, 'tan and white')
puts pudding, butterscotch
# => My cat Pudding is 7 years old and has black and white fur.
# => My cat Butterscotch is 10 years old and has tan and white fur.
