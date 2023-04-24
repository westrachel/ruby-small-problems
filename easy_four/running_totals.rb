def running_total(arr)
  running_total_arr = []
  total = 0
  arr.each do |num|
    total += num
    running_total_arr.push(total)
  end
  running_total_arr
end

# check work:
puts running_total([2, 5, 13]) == [2, 7, 20]
puts running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
puts running_total([3]) == [3]
puts running_total([]) == []

# Enumerable further exploration:
def running_total(arr)
  sum = 0
  arr.each_with_object([]) {|orig_element, arr| arr << sum += orig_element }
end

# check work:
puts running_total([2, 5, 13]) == [2, 7, 20]
puts running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
puts running_total([3]) == [3]
puts running_total([]) == []
