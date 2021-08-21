# Given the Rectangle class, create a Square class that is a subclass of Rectangle and is used
#    in the following way:
#square = Square.new(5)
#puts "area of square = #{square.area}"

class Rectangle
  def initialize(height, width)
    @height = height
    @width = width
  end

  def area
    @height * @width
  end
end

class Square < Rectangle
  def initialize(side)
    @height = side
    @width = side
  end
end

square = Square.new(5)
puts "area of square = #{square.area}"
# => area of square = 25