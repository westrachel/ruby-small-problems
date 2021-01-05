#1. Create a String
#create an empty string using the String class and assign it to a variable

blank_string = ""

#alternative ways to create an empty string:
blank_string = String.new

#2. Quote Confusion 
#modify the following code so that doube-quotes are used instead of single-quotes
#puts 'It\'s now 12 o\'clock.'
#desired output: It's now 12 o'clock.
puts "It's now 12 o'clock."

#3. Ignoring Case
#compare the value of name = 'Roger' to 'RoGer'
# while ignoring the case of both strings 
# print true if the values are the same, print false if they aren't 
# then perform the same case-sensitive comparison, except compare the value of 
# name with the string 'DAVE' instead of 'RoGer'
# so should output true then false
name = 'Roger'
puts name.downcase == 'RoGer'.downcase
puts name.downcase == 'DAVE'.downcase

#note other method could have used:
# casecmp compares the value of 2 strings while ignoring the case of both strings 
# the comparison is not case sensitive and returns 0 if strings are equivalent 
puts name.casecmp('RoGer') == 0

#4. Dynamic String
#modify the code so that the value of name is printed w/in "Hello, !"
name = 'Elizabeth'
#puts "Hello, !"
puts "Hello, #{name}!"

#5. Combining Names
#use the following code and combine the two name together to form a full name
# and assign that value to a variable named full_name 
# then print the value of full_name
first_name = "John"
last_name = "Doe"
full_name = "#{first_name} #{last_name}" 
puts full_name

#other ways to combine first and last name 
full_name = first_name + " " + last_name

full_name =''
full_name << first_name 
full_name << last_name 


#6. Tricky Formatting 
# state = 'tExAs'
# capitalize the value of state then print the modified value 
# state should have the modified value both before and after you print it
# the expected output = Texas
state = 'tExAs'
state = state.capitalize!#tested in irb, don't need to downcase state first
print state


#7. Goodbye, not Hello
# invoke a destructive method on greeting so that Goodbye! is printed instead of hello!
greeting = 'Hello!'
greeting["Hello!"] = "Goodbye!"
puts greeting

#8. Print the Alphabet
alphabet = 'abcdefghijklmnopqrstuvwxyz'
#split the value of alphabet by individual characters and print each character
puts alphabet.chars

#alternate way:
puts alphabet.split('')

#9. Pluralize
words = 'car human elephant airplane'
#use each to print the plural of each word in words 
word = []
word << words.split(' ')
word.flatten!
#puts words.split(' ') + 's'
word.each do |word|
    puts word + 's'
end 

#alternative streamlined solution:
words.split(' ').each do |word|
  puts word + 's'
end 

#10. Are you there?
colors = 'blue pink yellow orange'
# print true if colors includes yellow and false if it doesn't 
# print true if colors includes purpole and false if it doesn't
#expect first true and then false
puts colors.include?("yellow")
puts colors.include?("purple")