# Edit the House class so that the puts method calls work; allowed to define only 1 method

# notes:
# undefined method '<' for House object is returned
# based on ruby documents, the comparable module uses the underlying <=> method, so if I'm only allowed to define
#  1 method to fix the below code, then I should create a specific <=> method for the House class that compares
#  the price instance variable for 2 house objects
# also, need to make sure the House class has access to the Comparable module which contains the <=> method

class House
  include Comparable
  attr_reader :price

  def initialize(price)
    @price = price
  end
  
  # added House class method:
  def <=>(object2)
    @price <=> object2.price
    
  end
end

home1 = House.new(100_000)
home2 = House.new(150_000)
puts "Home 1 is cheaper" if home1 < home2
# => Home 1 is cheaper
puts "Home 2 is more expensive" if home2 > home1
# => Home 2 is more expensive
