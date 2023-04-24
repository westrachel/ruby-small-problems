#1. Unpredictable Weather (Part 1)
sun = ['visible', 'hidden'].sample
#write an if statement that prints "The sun is so bright" if the sun is visible
if sun == "visible"
  puts "The sun is so bright!"
end 


#2. Unpredictable Weather (Part 2)
#write an unless statement that prints "The clouds are blocking the sun!"
#unless sun is visible 
unless sun == "visible"
  puts "The clouds are blocking the sun!"
end 

#3. Unpredictable Weather (Part 3)
#write an if statement that prints the sun is so bright if sun is visible 
# also write an unless statement that prints the clouds are blocking the sun unless the sun is visible 
#use statement modifiers instead of an if..end statement to print results when some condition is met 
puts "The sun is so bright!" if sun == "visible"
puts "The clocks are blocking the sun!" unless sun == "visible"


#4. True or False
boolean = [true, false].sample
#write a ternary operator that prints "I'm true!" if boolean is true 
# and prints false otherwise
boolean ? puts("I'm true!") : puts("I'm false!")

#5. Truthy Number
#number = 7

#if number
 # puts "My favorite number is #{number}."
#else
 # puts "I don't have a favorite number."
#end
#what should the above commented out code print and why?
# it should print "My favorite number is 7.", because 7 is a truthy value
# numbers in general are truthy
# the only things that aren't truthy are nil and false


#6. Stoplight (Part 1)
stoplight = ['green', 'yellow', 'red'].sample
#write a case statement that prints go if stoplight equals green,
# slow down if stoplight is yellow, and stop if stoplight is red
case stoplight 
  when "green"
    puts "Go!"
  when "yellow" 
    puts "Slow Down!"
  when "red"
    puts "Stop!"
end 

#7. Stoplight (Part 2)
#convert the prior case statement to an if statement
if stoplight == "green"
  puts "Go!"
elsif stoplight == "yellow"
  puts "Slow Down!"
else 
  puts "Stop!"
end 


#8. Sleep Alert
status = ['awake', 'tired'].sample
#write an if statement that returns "Be productive!" if status equals awake 
#and returns "Go to sleep!" otherwise 
#then assign the return value of the if statement to a variable and print that value 
return_value = if status == "awake"
                 "Be productive!"
               else 
                 "Go to sleep!"
               end 
puts return_value

#9. Cool Numbers
number = rand(10)

#if number = 5
#  puts '5 is a cool number!'
#else
#  puts 'Other numbers are cool too!'
#end
#in the above commented out code, 5 is a cool number is being printed every time the program is run
#fix the code so that Other numbers are cool to gets a chance to be executed
if number == 5
  puts '5 is a cool number!'
else
  puts 'Other numbers are cool too!'
end


#10. Stoplight (Part 3)
stoplight = ['green', 'yellow', 'red'].sample

case stoplight
when 'green'
  puts 'Go!'
when 'yellow'
  puts 'Slow down!'
else
  puts 'Stop!'
end
#reformat the above case statement so that it only takes up 5 lines
case stoplight
 when 'green' then  puts 'Go!'
 when 'yellow' then puts 'Slow down!'
 else               puts 'Stop!' 
end