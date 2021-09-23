# Write a FixedArray class that results in the latter method invocations printing true
#    16 times

class FixedArray

  def initialize(num_elements)
    @array = []
    num_elements.times { |_| @array << nil }
  end

  def [](index)
    # @array[index]     # This initial definition won't produce
                        #  the desired IndexError Exceptions.
                        # Specifically, looking at the IndexError Ruby doc,
                        #  only the fetch method is defined to raise an Index
                        #  Error if the index argument is not an actual index
                        #  of the array in question. So, change implementation to
                        #  use fetch
    @array.fetch(index) 
  end

  def []=(index, value)
    # first, test if the index is valid, otherwise raise an exception
    @array.fetch(index)
    @array[index] = value
  end

  # based on the .to_a call below, to_a needs to act like a getter
  #  method for the defined @array instance variable
  def to_a
    @array
  end

  # can leverage previously defined getter method that will return
  #  an array and then chain the to_s method invocation that will
  #  turn an array object into a string version of its array
  def to_s
    to_a.to_s
  end

end


fixed_array = FixedArray.new(5)
puts fixed_array[3] == nil
# => true
puts fixed_array.to_a == [nil] * 5
# => true

fixed_array[3] = 'a'
puts fixed_array[3] == 'a'
# => true
puts fixed_array.to_a == [nil, nil, nil, 'a', nil]
# => true

fixed_array[1] = 'b'
puts fixed_array[1] == 'b'
# => true
puts fixed_array.to_a == [nil, 'b', nil, 'a', nil]
# => true

fixed_array[1] = 'c'
puts fixed_array[1] == 'c'
# => true
puts fixed_array.to_a == [nil, 'c', nil, 'a', nil]
# => true

fixed_array[4] = 'd'
puts fixed_array[4] == 'd'
# => true
puts fixed_array.to_a == [nil, 'c', nil, 'a', 'd']
# => true
puts fixed_array.to_s == '[nil, "c", nil, "a", "d"]'
# => true

puts fixed_array[-1] == 'd'
# => true
puts fixed_array[-4] == 'c'
# => true

begin
  fixed_array[6]
  puts false
rescue IndexError
  puts true
end
# => true

begin
  fixed_array[-7] = 3
  puts false
rescue IndexError
  puts true
end
# => true

begin
  fixed_array[7] = 3
  puts false
rescue IndexError
  puts true
end
# => true