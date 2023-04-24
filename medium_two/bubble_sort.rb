# Problem / Data:
# Create a method that accepts one array argument input (that contains at least 2 elements
# that can be numbers or strings) and compares 2 consecutive elements at a time using the bubble-sort algorithm.
# <=> All consecutive elements will be compared and should be sorted from smallest to largest.
# Output of the method:
#  > the inputted array mutated so that it's sorted from smallest to largest

# Examples:
#array = [6, 2, 7, 1, 4]
#bubble_sort!(array)
#array == [1, 2, 4, 6, 7]

#array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
#bubble_sort!(array)
#array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)

# Algorithm:
# 1. store the passed in array to a new variable called copy_arr
# 2. initialize an outer loop
# 2. initialize an index variable that points to the value 0
# 3. initialize an inner loop and within each iteration
#       i. compare the element located at the index value = to the index variable's value to the
#           element located at the index variabe's value plus 1
#       ii. if the element at the smaller index being compared in step i. is greater than
#.           the second element being compared, then switch the places/locations of the elements being compared
#       iii. add one to the index variable's value
#       iv. break if the index variable's value plus 1 is equivalent to the inputted array's size
# 4. check if the array has been mutated such that the array is equivalent to the copy_arr sorted (using the #sort method)
#      > if they are equivalent then break out of the outer loop
#      > if the are not, then loop repeat steps 2-3 and this step (this may be required to make sure the entire array is sorted from
#         smallest to largest and not just that consecutive pairs are sorted)
# 5. return the mutated inputted array

# Code:
def bubble_sort!(arr)
  copy_arr = arr
  loop do
    idx = 0
    loop do
      a = arr[idx]
      b = arr[(idx + 1)]
      if a > b
        arr[idx] = b
        arr[(idx + 1)] = a
      end
      idx += 1
      break if (idx+1) == arr.size
    end
    break if arr == copy_arr.sort 
  end
  arr
end

# check work:
array = [5, 3]
bubble_sort!(array)
p array == [3, 5]
# => true

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
p array == [1, 2, 4, 6, 7]
# => true

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
bubble_sort!(array)
p array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
# => true
