## LOOPS 1 ## 

#1. Runaway loop
# modify the infinite loop code, so that it stops after the first iteration:
#loop do
 # puts 'Just keep printing...'
#end
# add reserved word break to stop the looping
loop do
  puts 'Just keep printing...'
  break
end

#2. Loopception
# stop both of the loops (one is nested) from running infinitely 
# each loop should stop after the first iteration
#loop do
 # puts 'This is the outer loop.'

  #loop do
   # puts 'This is the inner loop.'
  #end
#end

#puts 'This is outside all loops.'

loop do
  puts 'This is the outer loop.'
  
  loop do
    puts 'This is the inner loop.'
    break     #break out of the nested loop
  end
  break     #break out of the outer loop
end

puts 'This is outside all loops.'
#side note: this exercise is to further understand loops
# it is not to encourage using loops to do something one time 

#3. Control the Loop 
#modify the following loop so it iterates 5 times instead of just once
#iterations = 1

#loop do
 # puts "Number of iterations = #{iterations}"
#  break
#end

iterations = 1

loop do
  puts "Number of iterations = #{iterations}"
  iterations += 1
  break if iterations == 6 
end

#4. Loop on Command
#modify te code so that the loop stops iterating when the user inputs 'yes'
#loop do
 # puts 'Should I stop looping?'
  #answer = gets.chomp
#end

loop do 
  puts 'Should I stop looping?'
  answer = gets.chomp 
  break if answer == 'yes'
end 

#5. Say Hello
# modify the code so that Hello! is printed 5x 
#say_hello = true

#while say_hello
 # puts 'Hello!'
  #say_hello = false
#end

say_hello = true

while say_hello 
  counter = 1
  while counter <= 5
    puts 'Hello!'
    counter += 1
  end 
  say_hello = false
end

#alternative solution that doesn't use a nested while loop:
say_hello = true
count = 0 
while say_hello 
  puts 'Hello!'
  count += 1
  say_hello = false if count == 5 
end 

#6. Print While
#using a while loop, print 5 random #s between 0 and 99 
#notes on researched methods that will assist in this task:
# length method can be called on arrays and will return the length of the array
# rand method will return random numbers 
# but if using rand to get an integer between 0 and 99, need to pass 100 into rand() 
# <=> rand(100) would not return 100 
# otherwise just specifying rand will print a float between 0 and 1
numbers = []

while numbers.length < 5
  numbers << rand(100)      #push random integers between 0 and 99  
end 

puts "5 random integers between 0 & 99: #{numbers}" 

#note: could also use the size method 
nums = []
while nums.size < 5
  nums << rand(100)
end 
puts "Another 5 random integers between 0 & 99: #{nums}" 

#7. Count Up
# following code outputs a countdown from 10 to 1
# modify the code so that it counts from 1 to 10 instead
count = 10 
until count == 0 
  puts count 
  count -= 1
end 

count_up = 1
until count_up == 11 
  puts count_up 
  count += 1
end 

#8. Print Until
#use an until loop to print each number in the array
numbers = [7, 9, 13, 25, 18] #5 elements, indexes = from 0 to 4
index = 0
until index == 5
  puts numbers[index]
  index += 1 
end 

#alternative solution where you don't have to specify an index
until count == numbers.size 
  puts numbers[count]
  count += 1
end 

#9. That's odd
#modify the code so that it only outputs i if i is an odd number
for i in 1..100
  puts i if i % 2 != 0
end 

#alternative solution that uses a built in method 
for i in 1..100
  puts i if i.odd?
end 

#10. Greet Your Friends 
friends = ['Sarah', 'John', 'Hannah', 'Dave']
#use a for loop to greet each friend individually
for bud in friends do 
  puts "Hey " + bud 
end 

## END LOOPS 1 ## 


## LOOPS 2 ## 
#1. Even or odd?
# write a loop that prints #s 1-5 and whether number is even or odd
count = 1
loop do 
  if count.odd?
    puts "#{count} is odd"
  else 
    puts "#{count} is even"
  end 
  count += 1
  break if count == 6
end 

#2. Catch the number
#modify the code so that the loop stops if number is equal to or between 0 and 10 
#loop do 
 # number = rand(100)
  #puts number
#end

loop do 
  number = rand(100)
  puts number
  break if (number >= 0 && number <= 10 )
end

#alternative solution that uses built-in ruby method 
loop do 
  number = rand(100)
  puts number
  if number.between?(0, 10)
    break
  end 
end

#3. Conditional Loop 
process_the_loop = [true, false].sample
#write a program w/ an if/else statement that prints 
# the loop was processed if process_the_loop is true
# or the loop wasn't processed if process_the_loop is false
if process_the_loop
  puts "The loop was processed!"
else 
  puts "The loop wasn't processed!"
end 

#different ask: run a loop that prints loop was processed
# one time if process_the_loop equals true; use an if/else statement
if process_the_loop
  loop do          #run the loop only if process_the_loop is true
    puts "The loop was processed!"
    break 
  end 
else 
  puts "The loop wasn't processed!"
end 

#4. Get the Sum
#modify the code so that's correct is printed and the loop stops 
# when the user's answer equals 4 
# print wrong answer try again if user's answers doesn't equal 4
#loop do
 # puts 'What does 2 + 2 equal?'
#  answer = gets.chomp.to_i
#end
loop do
  puts 'What does 2 + 2 equal?'
  answer = gets.chomp.to_i
  if answer == 4
    puts "That's correct"
    break 
  else 
   puts "Wrong answer. Try again!"
  end 
end

#5. Insert Numbers
# modify the code, so that the user's input gets added to the numbers array
#stop the loop when the array contains 5 numbers
#numbers = []

#loop do
 # puts 'Enter any number:'
#  input = gets.chomp.to_i
#end
#puts numbers

numbers = []

loop do
  puts 'Enter any number:'
  input = gets.chomp.to_i
  numbers << input 
  break if numbers.size == 5
end
puts numbers

#recall: alternative way to push something to an array besides using <<
#also, alternative to size method is length method
numbers = []

loop do
  puts 'Enter any number:'
  input = gets.chomp.to_i
  numbers.push(input)
  break if numbers.length == 5
end
puts numbers


#6. Empty the Array
names = ['Sally', 'Joe', 'Lisa', 'Henry']
#use loop to remove and print each name 
# stop the loop once names doesn't contain any more elements 
loop do 
  puts names[0]
  names.delete_at(0)
  break if names.empty?
end 

#alternative solution:
#use shift method which returns the first item of object method is called on 
# or returns nil 
loop do 
  puts names.shift
  break if names.empty?
end 

#7. Stop Counting
#modify the block so that it prints the current number 
#and stops iterating when the current number equals 2
# 5.times do |index|
# ...
# end 
5.times do |index|
  puts index 
  break if index == 2
end 

#8. Only Even
#use next and modify the code below, so that only even numbers are printed
number = 0 

until number == 10    #so executes until condition is true
  number += 1
  next if number % 2 > 0 #skip puts line if not even
  puts number 
end 

#alternative solution using built-in ruby method:
until number == 10 
  number += 1
  next if number.odd?
  puts number
end 


#9. First to Five
#use next to modify the code so that the loop iterates until either
#number_a or number_b equals 5 
#print 5 was reached before breaking out of the loop 

number_a = 0
number_b = 0

loop do
  number_a += rand(2)
  number_b += rand(2)

  if (number_a == 5 || number_b == 5)
    puts "5 was reached!"
    break
  end 
  puts "Still iterating..."
end

#alternative solution using unless instead of an if/else
loop do 
  number_a += rand(2)
  number_b += rand(2)
  
  next unless number_a == 5 || number_b == 5 #skips to the next iteration unless either num a or b is 5 
  puts '5 was reached!'               # so, next skips not just the next line, but all subsequent lines in the iteration 
  break
end 
  

#10. Greeting
# use a while loop to print "hello!" twice
def greeting 
  puts "Hello!"
end 

number_of_greetings = 2 

while number_of_greetings != 0 
  greeting  
  number_of_greetings -= 1
end 