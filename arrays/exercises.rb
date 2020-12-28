#Exercise 1:
arr = [1, 3, 5, 7, 9, 11]
number = 3

answer = arr.include?(number)
puts "T/F: your array includes #{number}."
puts "#{answer.to_s.upcase}."

#practice using .each
#arr.each { |num|
 # if num == number 
  #  puts "#{number} is in the array!"
  #else
   # puts "#{number} is not in the array." <=> this is going to print out that 3 is not in the array for every element in the array, which is clunky
  #end
#}

arr.uniq!  #remove duplicates (if there hypotehtically were any, so that only print that the # is in the array once)
arr.each {|num| 
  if num == number
    puts "#{number} is in the array!"
  end
}


#Exercise 2:
array1 = ["b", "a"]
array1 = array1.product(Array(1..3))
##product combines each element of array1 (a and b) with each element of Array(1..3) in order
## Array(1..3) corresponds to the array: [1, 2, 3] (2 dots = inclusive of the specified upper bound 3)
## reassigning array1 to the "product" of array1 and Array(1..3)
## so, array1 should = [["b", 1], ["b", 2], ["b", 3], ["a", 1], ["a", 2], ["a",3]]
array1.first.delete(array1.first.last)
## array1.first returns the first element of array1: ["b", 1]
## delete() permanently deletes the value specified 
## array1.first.last returns the last element of the first element of array1 which is 1
## so this will permanently delete 1 from ONLY the first element of array1

array2 = ["b", "a"]
array2 = array2.product([Array(1..3)])
## [Array(1..3)] contains one element: [1, 2, 3]
## array 2 is reassigned from ["b", "a"] to [["b", [1, 2, 3]], ["a", [1, 2, 3]]]
array2.first.delete(array2.first.last)
## array2.first returns the first element = ["b", [1, 2, 3]]
## array2.first.delete(array2.first.last) deletes [1, 2, 3]
# so, [1, 2, 3] is permanently deleted from ONLY the first element of array2 


#Exercise 3:
# How do you return the word "example from the following array?"
ar = [["test", "hello", "world"],["example", "mem"]]

#there are multiple ways to return "example":
ar.last.first 
ar[1].first

#Exercise 4:
c = [15, 7, 18, 5, 12, 8, 5, 1]
# What does each method return in the following example?
#part 1:
c.index(5) #returns 3, the index of the first instance of the element 5 in the array

#part 2
c.index[5] #returns a NoMethodError

#part 3
c[5] #returns 8, the element at the fifth index of the array; indices start at 0

#Exercise 5:
string = "Welcome to America!"
a = string[6]
b = string[11]
c = string[19]
d = string[7]

#what is the value of a, b, and c?
# a should return e
# b should return A
# c should return nil, because there is no 19th index to call a value from
# d should return a empty value, not nil, but just a space/blank character I think
##       string[7] returns " " 

#Exercise 6:
#names = ['bob', 'joe', 'susan', 'margaret']
#names['margaret'] = 'jody'
#returns the error: TypeError: no implicit conversion of String to Integer...

#what is the problem and how can it be fixed?
# array_name[value] is used to return the value at a specific index 
# so, "value" should be an integer that corresponds to the desired index
# if want to reassign 'margaret' to 'jody', use the code:
# names[3] = 'jody'       #margaret is located at the 3rd index of the names array


#Exercise 7:
running_teams = ["BTC", "Tinman Elite", "Brooks"]
puts "Teams racing at today's invitational:"
running_teams.each_with_index { |value, index| 
  puts "#{index+1}. #{value} "
}

#Exercise 8:
one = [1, 2, 3, 4, 5, 6]
two = one.map { |x| x + 2}
p one 
p two

#alternative way:
three = []
one.each { |element_of_one|
  three.push(element_of_one + 2)
}
p one
p three

#another alterantive:
four = []
one.each do |one_element|
  four << one_element + 2
end 
p one 
p four
  







