# Problem:
# Create a method that takes two arrays and combines the elements of these
# arrays one after the other in a new returned array

# valid assumptions:
# > both passed in arrays are non-empty and they have the same # of elements

# Example:
# interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']

def woven_array(array1, array2)
  woven_arr = []
  index = 0
  loop do
    woven_arr.push(array1[index]).push(array2[index])
    index += 1
    break if index == array1.size
  end
  woven_arr
end

# check work:
puts woven_array([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']
# => true

# Further Exploration:
# Write an interleave method that uses Array#zip
def interleave(array1, array2)
  array1.zip(array2).flatten
end

# check work:
puts interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']
# => true
