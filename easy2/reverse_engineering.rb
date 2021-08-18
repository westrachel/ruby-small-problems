# Write a class that will display ABC an then xyz (on subsequent separate lines) when
#  the following is run:
# my_data = Transform.new('abc')
# puts my_data.uppercase
# puts Transform.lowercase('XYZ')

class Transform
  def initialize(str)
    @string = str
  end
  
  def uppercase
    @string.upcase
  end
  
  def self.lowercase(str)
    str.downcase
  end
end

my_data = Transform.new('abc')
puts my_data.uppercase
puts Transform.lowercase('XYZ')
