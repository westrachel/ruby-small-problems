# What should the following print:
puts Something.dupdata  
# > the above line is calling the dupdata class method and passing in that return value to the puts method invocation
# > class methods are defined with self, and as shown below, the return value of the class method dupdata is the string 'ByeBye'
# > accordingly, this line (puts Something.dupdata) should print 'ByeBye'
puts thing.dupdata
# > the above line is calling the dupdata instance method of the Something class on the thing object (an object of the Something class)
# > the dupdata instance method, as shown below, returns string object that the @data instance variable points to twice
# > accordingly, puts thing.dupdata should print 'HelloHello'

class Something
  def initialize
    @data = 'Hello'
  end

  def dupdata
    @data + @data
  end

  def self.dupdata
    'ByeBye'
  end
end

thing = Something.new
