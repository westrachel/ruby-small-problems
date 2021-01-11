#PEDAC:
#Problem:
#       define a method with one positive integer argument that returns a string of alternating 1s and 0s 

#Examples:
# the following should print true 
#puts stringy(6) == '101010'
#puts stringy(9) == '101010101'
#puts stringy(4) == '1010'
#puts stringy(7) == '1010101'

#Data Structure:
#    input = one positive integer   (no functionality is specified for negative integers, so assuming positive integer inputs only)
#          > integer value determines the length of the string output
#          > outputted string should be made up of 1s and 0s only, with 1 being the firt digit
#Algorithm:
#     i. specify one argument for the method that's assumed to be a positive integer
#     ii. create empty array 
#     iii. push the string 1 to the array a # of times equivalent to the positive integer specified 
#     iv. replace the "1" strings at the odd indices in the array w/ "0"
#     v. join the strings in the array into one string (converting an array into a string w/ no spaces between the strings taken from the array)

#Code:
def stringy(pos_int)
  array = []
  pos_int.times { array << "1" }
  array = array.each_index { |index|
    if index % 2 == 1
      array[index] = "0"
    end
  }
  array * ""    #this is equivalent to array.join
end

#check solution: (all of the following should print true)
puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'


#alternative solution:
# use a ternary operator to push 1 or 0 to an empty array depending on the index
# times starts counting at 0, so first item pushed will be 1 
# this avoids rewriting elements pushed to the array like I did in my solution


#Further exploration:
#modify string so it takes an additiona optional argument that defaults to 1
# if the method is called with this argument set to 0, the method should return a string of alternating 0s and 1s, starting with 0 instead of 1
def stringy(value, start_str_val=1)
  array = []
  if start_str_val == 0
    value.times {|idx| 
    int = idx.even? ? 0 : 1
    array << int}
  else 
    value.times { |idx|
    int = idx.even? ? 0 : 1
    array << int}
  end
  
  array.join
end 
  
puts stringy(6, 0)