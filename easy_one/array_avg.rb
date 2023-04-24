#PEDAC:
#Problem:
#      define method that takes one argument = array of integers 
#        and returns the avg of all numbers in the array
#      givens: array will never be empty and the #s will always be positive integers 
#         your result should be an integer

#Examples:
#puts average([1, 6]) == 3 # integer division: (1 + 6) / 2 -> 3
#puts average([1, 5, 87, 45, 8, 8]) == 25
#puts average([9, 47, 23, 95, 16, 52]) == 40
# all the above should print true

#Data Structure:
#      input = array of positive integers 
#      output = integer equivalent to the average of all the summed positive integers in the array

#Algorithm:
#    i. define method that takes one array argument input
#    ii. set a divisor variable equal to the number of elements in the inputted array (this will be used later in the average calculation) 
#           > can call #size or #length or the array input to get the number of elements in it 
#           > also, tested it out in irb and array.length.is_a?(Integer) & array.size.is_a?(Integer) both return as true <=> so, can use divisor variable directly in the calculation 
#    iii. sum up all the integers in the array & store in a variable called sum
#    iv. divide sum by divisor

#Code:
def average(array)
  divisor = array.length
  sum = 0
  array.each do |integer|
    sum += integer
  end
  sum / divisor
end 


#check solution: (all should print as true)
puts average([1, 6]) == 3 # integer division: (1 + 6) / 2 -> 3
puts average([1, 5, 87, 45, 8, 8]) == 25
puts average([9, 47, 23, 95, 16, 52]) == 40

#alternative solution uses the Enumerable#reduce method

#Further Exploration:
#currently, the return value of average is an Integer 
# when dividing #s, return a float instead of an integer 
#solution:
# tested in irb: if change one of the values in a division expression to a float, the value returned is also a float 
def average(array)
  divisor = array.length
  sum = 0
  array.each do |integer|
    sum += integer
  end
  sum / divisor.to_f
end 

#check that a float is now returned from average
puts average([1, 6]) #should print 3.5