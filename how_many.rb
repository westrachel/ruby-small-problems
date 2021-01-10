#PEDAC:
#Problem:
#      defined a method that counts the number of times each element occurs in an array
#      ounce counted, the method should print each element & the number of times they happen
#Examples:
#vehicles = ['car', 'car', 'truck', 'car', 'SUV', 'truck', 
#              'motorcycle', 'motorcycle', 'car', 'truck']
# count_occurrences(vehicles)
#   output:
#       car => 4
#       truck => 3
#       SUV => 1
#       motorcycle => 2

#Data Structure:
#      method should treat words w/ different capitalization patterns as different even if they represent the same word
#          so, car != Car

#Algorithm:
#     i. take the first element in a given array (corresponds w/ index 0)
#     ii. establish a counter for the number of times the first element in a given array occurs, set it equal to 1 at the beginning
#     iii. mutate the array to remove the first element from the array
#     iv. check each of the mutated array's elements to see if they match the first element in the given array
#     v. every time there is a match add to the counter 
#     vi. once done checking the mutated array print "#{first element} => #{counter}"
#     vii. remove all exact instances of that first element from the array and repeat process for each unique element in the given array 
#     viii. break when the array provided's 0th index is empty

#Code:
def count_occurrences(array)
  loop do 
    first_element = array[0]
    counter = 1
    array.drop(1).each { |mutated_array_element|
      counter += 1 if mutated_array_element == first_element
    }
    puts first_element + ' => ' + counter.to_s
    
    array = array.delete_if{ |element| element == first_element
    }
  break if array.empty?
  end 
end

vehicles = ['car', 'car', 'truck', 'car', 'SUV', 'truck', 
              'motorcycle', 'motorcycle', 'car', 'truck']
count_occurrences(vehicles)

#alternative solution:
# create a hash where key = unique word & value = count 
# leverage Array#uniq & Array#count methods

#Further Exploration:
# try to solve the problem when words are case sensitivie (so suv = SUV)
#add section to code that mutates provided array by lowercasing all letters in each word of the array
# String#downcase! will mutate the caller
def count_occurrences(array)
  array.each { |word| word.downcase! }
  loop do 
    first_element = array[0]
    counter = 1
    array.drop(1).each { |mutated_array_element|
      counter += 1 if mutated_array_element == first_element
    }
    puts first_element + ' => ' + counter.to_s
    
    array = array.delete_if{ |element| element == first_element
    }
  break if array.empty?
  end 
end

auto = ['car', 'car', 'truck', 'car', 'SUV', 'truck', 'motorcycle', 'motorcycle', 'car', 'truck', "suv"]
#check work: expecting suv => 2
count_occurrences(auto) 
# note, this solution will print "suv => 2", not "SUV => 2" since downcase all words in the provided array, but I think that's a workable
# enough solution for this further exploration exercise

