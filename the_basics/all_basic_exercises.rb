#exercise 1
puts "Exercise 1: Write a name"
puts 'Ruth' + 'Ginsburg'   #could also use double quotes, choosing to print the value when execute file


#exercise 2
puts "Exercise 2: return digits of user inputted number"
#four digit number, ex 1234, and want to return 1, 2, 3, 4
# ruby won't return a decimal if enter integers into division 
puts "Enter a 4 digit number"
number_input = gets.chomp
if number_input.length == 4 
   number = number_input.to_i
else 
  puts "You did not enter a 4 digit number. Try again."
end 
thousands_place = number / 1000 #won't return 1.234 if run 1234 divided by 1000 
hundreds_place = number % 1000 / 100  
       #first, use % to sciphon off the first digit & be left with the remaining thee
       #then, use divide by 100 to return the hundreds place decimal b/c again no decimals = returned here
tens_place = number % 1000 % 100 / 10 
ones_place = number % 1000 % 100 % 10 
puts "The digits in your number: #{thousands_place}, #{hundreds_place}, #{tens_place}, #{ones_place}."

#exercise 3
puts "Exercise 3: return movie years from a hash"
movie_titles = { :titanic => "1997",  #using older rocket hash syntax
                :inception => "2010",
                :aladdin => "1992",
                :mulan => "2020"
}
  puts "Movie release years:"
movie_titles.each { |key, value|
  puts value
  }
  
#alternatively, code have called each value w/ puts movie_titles[:movie_name]

#exercise 4
puts "Exercise 4: return movie years from an array"
empty_array = []
movie_titles.each {|key, value|
  empty_array.push(value)
}
puts "Movie release years:"
puts empty_array

#exercise 5
puts "Exercise 5 part 1: print the factors that makeup 5, 6, 7, 8"
a = [5, 6, 7, 8]
a.each do |x|
1.upto(8) {|factor|
  if x % factor == 0 
    puts factor #this is going to print an ugly list w/ a lot of rows, but it will print on each row a factor of each respective integer 
  else 
  end 
}
end

puts "Exercise 5 part 2: print (as strings) the factorials for 5, 6, 7, 8"
a = "5 * 4 * 3 * 2 * 1"
puts a
b = "6 * #{a}"
puts b 
c = "7 * #{b}"
puts c
d = "8 * #{c}"
puts d

puts "Exercise 5 part 3: print (as integers) the factorials for 5, 6, 7, 8"
a = 5 * 4 * 3 * 2 * 1
puts a
b = 6 * a
puts b 
c = 7 * b
puts c
d = 8 * c
puts d

#exercise 6
puts "Exercise 6: square some floats"
floats = [1.2795, 3.14, -4.6789]
floats.each do |x|
  puts x ** 2 
end 



#exercise 7
#perhaps you were trying to create a hash or run a .each {} and instead of writing 
# the ending curly bracket (}) you wrote a parenthesis ')' and now you're getting a syntax error
# it looks like you were working in the terminal (opened a temporary session w/ irb)
# you're in the main branch of a local repo: /usr/local/rvm/rubies 
# the ruby version is 2.5.3 yay that's quite new/recent 