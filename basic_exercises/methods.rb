#1. Print Me (Part 1)
#write a method name print_me that prints "I'm printing w/in the method!" when invoked
def print_me
  puts "I'm printing within the method!"
end 

print_me

#2. Print Me (Part 2)
#write a method named print_me so that 'I'm printing the return value! is printed 
# when running the following code:
# puts print_me
def print_me
  puts  "I'm printing the return value:"  
end 

puts print_me #this will print puts' return value = nil & also print the header "I'm printing the return value:"

#alternative solution for a different ask:
# different ask = print only the return value not puts' return value "I'm printing the return value"
def print_me
  "I'm printing the return value!"
end 

puts print_me

#3. Greeting Through Methods (Part 1)
#write 2 methods: 
# i. returns the string hello 
# ii. reutrns the string world 
# then print both strings using puts, combining them into one sentence 
def hello 
  "Hello"
end 

def world 
  "World!"
end 

puts "#{hello} #{world}"

#4. Greeting Through Methods (Part 2)
#write a method greet that invokes the following methods:
def hello
  'Hello'
end

def world
  'World'
end
#greet should output Hello World when it's invoked <=> note the space between the words
#invoke greet w/ puts

def greet
  hello + ' ' + world 
end 

puts greet


#5. Make and Model 
#write a method called car that takes 2 arguments and prints a string
#containing the value of both arguments
#example of expected output:
#car('Toyota', 'Corolla') should output Toyota Corolla
def car(arg1, arg2)
  puts "#{arg1} #{arg2}"
end 

car('Toyota','Corolla')

#6. Day or Night?
#write a method time_of_day that given a boolean argument
# print 'it's daytime' if true and 'it's nighttime' is false 
#pass daylight = [true, false].sample into the method as the argument 
daylight = [true, false].sample
def time_of_day(time)
  if time 
    puts "It's daytime!"
  else 
    puts "It's nighttime"
  end 
end

time_of_day(daylight)

#7. Naming Animals 
#run the following and note the errors
#based on the errors, update method so that the names Spot (dog) and Ginger (cat) are printed 
#def dog
 # return name
#end

#def cat(name)
 # return name
#end

#puts "The dog's name is #{dog('Spot')}."
#puts "The cat's name is #{cat}."

#errors found:
# wrong number of arguments for dog <=> tried to pass in spot, but didn't define the method to accept arguments 
# if add (name) argument to dog method, second error is due to the fact that 0 arguments were passed into the puts cat line when 1 argument was expected
# the second line wouldn't have errored out if a default was set for name argument 
# fixed code:
def dog(name)
  return name
end

def cat(name)
  return name
end

puts "The dog's name is #{dog('Spot')}."
puts "The cat's name is #{cat('Ginger')}."


#8. Name Not Found 
#write a method that accepts, but does not req, one argument 
#parameter should default to string "Bob" if no arg = given 
#method' return value should be the value of the argument

def assign_name(name='Bob')
  name
end 

#the following should output true twice 
puts assign_name('Kevin') == 'Kevin'
puts assign_name == 'Bob'

#9. Multiply the Sum
#write methods for the following so that each output is true
#puts add(2, 2) == 4
#puts add(5, 4) == 9
#puts multiply(add(2, 2), add(5, 4)) == 36

def add(num1, num2)
  ans = num1 + num2 
end 

def multiply(num1, num2)
  product = num1 * num2
end 

puts add(2, 2) == 4
puts add(5, 4) == 9
puts multiply(add(2, 2), add(5, 4)) == 36

#10. Random Sentence 
#write the methods name and activity so that they each 
#take the appropriate array and return a random value from it
# then write the method sentence that combines both values into a sentence and returns it from the method

def name(array_input)
  array_input.sample
end 

def activity(array_input)
  array_input.sample
end 

def sentence(name, activity)
  name + ' went ' + activity + ' today!'
end 

names = ['Dave', 'Sally', 'George', 'Jessica']
activities = ['walking', 'running', 'cycling']

puts sentence(name(names), activity(activities))
  