# What's wrong with the following:
#  > private methods can't be called w/ self
#  > if remove self then the string 'xyz' would be printed 3 times
#  > alternatively, could comment out private and make the expand method no longer be a private method

class Expander
  def initialize(string)
    @string = string
  end

  def to_s
    #self.expand(3) remvoe self call
    expand(3)
  end

  private

  def expand(n)
    @string * n
  end
end

expander = Expander.new('xyz')
puts expander
# => xyzxyzxyz

class Expander
  def initialize(string)
    @string = string
  end

  def to_s
    self.expand(3)
  end

  # private
  
  def expand(n)
    @string * n
  end
end

expander = Expander.new('xyz')
puts expander
# => xyzxyzxyz
