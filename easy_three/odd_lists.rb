def oddities(array_input)
  even_indexed_elements = []
  array_input.each_index do |i|
    even_indexed_elements << array_input[i] if i.even? # 0.even? will return true
  end
  even_indexed_elements
end

# check work:
puts oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
puts oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
puts oddities(['abc', 'def']) == ['abc']
puts oddities([123]) == [123]
puts oddities([]) == []

# Further Exploration:
def doubles(array_input)
  odd_indexed_elements = []
  array_input.each_index do |i|
    odd_indexed_elements << array_input[i] if i.odd?
  end
  odd_indexed_elements
end

# check work:
puts doubles([2, 3, 4, 5, 6]) == [3, 5]
puts doubles([1, 2, 3, 4, 5, 6]) == [2, 4, 6]
puts doubles(['abc', 'def']) == ['def']

def doubles(array_input)
  odd_indexed_elements = []
  i = 1
  until array_input[i].nil?
    odd_indexed_elements << array_input[i]
    i += 2
  end
  odd_indexed_elements
end

# check work:
puts doubles([2, 3, 4, 5, 6]) == [3, 5]
puts doubles([1, 2, 3, 4, 5, 6]) == [2, 4, 6]
puts doubles(['abc', 'def']) == ['def']

def oddities(array_input)
  even_indexed_elements = []
  i = 0 
  while array_input[i]
  even_indexed_elements.push(array_input[i])
  i += 2
  end
  even_indexed_elements
end

# check work:
puts oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
puts oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
puts oddities(['abc', 'def']) == ['abc']
puts oddities([123]) == [123]
puts oddities([]) == []