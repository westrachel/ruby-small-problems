arr = ['10', '11', '9', '7', '8']

# order the array of number strings in descending numeric value

integer_arr = arr.map { |string| string.to_i }

descending_str_arr = integer_arr.sort.reverse.map do |int_element|
  int_element.to_s
end

# check work:
p descending_str_arr
# => ["11", "10", "9", "8", "7"]