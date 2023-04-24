#1. New Pet
pets = ['cat', 'dog', 'fish', 'lizard']
#select fish from pets, assign the return value to a variable named my_pet 
# then print the value of my_pet
my_pet = pets[2] 
puts "I have a pet #{my_pet}"

#2. More Than One
#select fish and lizard from the pets array at the same time
# assign the return value to a variable my_pets 
# print the content of my_pets as a single string 
# want to print I have a pet fish and a pet lizard
my_pets = pets[2..3]
puts "I have a pet #{my_pets[0]} and a pet #{my_pets[1]}."


#3. Free the Lizard
pets = ['cat', 'dog', 'fish', 'lizard']
my_pets = pets[2..3]
# remove lizard from my_pets then print the value of my_pets
# since lizard is the last element of my_pets can use pop method
my_pets.pop 
puts "I have a pet #{my_pets[0]}"


#4. One Isn't Enough
#select dog from pets, add the return value to my_pets,
# then print the value of my_pets
#expected output: I have a pet fish and a pet dog
my_pets.push(pets[1])
#alternatively could have written: my_pets << pets[1]
puts "I have a pet #{my_pets[0]} and a pet #{my_pets[1]}!"

#5. What Color Are You?
colors = ['red', 'yellow', 'purple', 'green']
#iterate over each of the colors and print 
# I'm the color ~color~!
colors.each do |color|
  puts "I'm the color #{color}!"
end 

#6. Doubled
numbers = [1, 2, 3, 4, 5]
#iterate over numbers and return a new array with each number doubled
#assign the returned array to a variable named doubled_numbers
#and print its value using #p 
# expected output = [2, 4, 6, 8, 10]

doubled_numbers = []
numbers.map {|num|
  doubled_numbers << num * 2
}
p doubled_numbers

#alternatively could have assigned doubled_numbers directly to the map invocation 
doubled_numbers = numbers.map do |num|
  num * 2
end 
p doubled_numbers

#7. Divisible by Three
numbers = [5, 9, 21, 26, 39]
#use select to iterate over numbers and return a new array that contains only #s divisible by three 
divisible_by_three = numbers.select {|num| num % 3 == 0 }
puts divisible_by_three

#8. Favorite Number (part 1)
['Dave', 7, 'Miranda', 3, 'Jason', 11]
#group each name w/ the number following it by placing the pair in their own array 
# then create a nested array containing all 3 groups 
#what does this look like? don't write the code to create it, just write out what it should look like 
#to show an understanding of nested arrays
#first the individual arrays should look like:
['Dave', 7]
['Miranda', 3]
['Jason', 11]
#second, the final nest array should look like:
[['Dave', 7], ['Miranda', 3], ['Jason', 11]]


#9. Favorite Number (part 2)
favorites = [['Dave', 7], ['Miranda', 3], ['Jason', 11]]
#flatten and print this array 
puts favorites.flatten

#10. Are We The Same?
array1 = [1, 5, 9]
array2 = [1, 9, 5]
#compare array1 and array2 and print true or false based on whether they match
#i'm assuming order doesn't matter, so first sort and then compare sorted arrays 
puts array1.sort == array2.sort #true! they match when don't care about matching elements' index
puts array1 == array2 #false! different order of matching elements
