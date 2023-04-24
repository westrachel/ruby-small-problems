#1. Reading Error Messages
def find_first_nonzero_among(numbers)
  numbers.each do |n|
    return n if n.nonzero?
  end
end

# Explain the errors reutrned if the following are run:
#find_first_nonzero_among(0, 0, 1, 0, 2, 0) 
             #entered too many arguments; only expect to pass through 1 argument, but the above line of code specifies 6 arguments 
#find_first_nonzero_among(1) 
             #tried to call a method on the wrong type; 
             #specifically, the each method is not defined to work on integers and the integer 1 is what's being passed into
             # the defined method

#2. Weather Forecast
def predict_weather
  sunshine = ['true', 'false'].sample

  if sunshine
    puts "Today's weather will be sunny!"
  else
    puts "Today's weather will be cloudy!"
  end
end
#the above commented code prints out the same output every time. Why?
# fix the code, so that the output is variable 
# solution:
# the "if sunshine" line will always evaluate to true, so Today's weather will be sunny will print every time
# new code:
def predict_weather
  sunshine = ['true', 'false'].sample

  if sunshine == 'true'
    puts "Today's weather will be sunny!"
  else
    puts "Today's weather will be cloudy!"
  end
end
predict_weather

#3. Multiply By Five
def multiply_by_five(n)
  n * 5
end

puts "Hello! Which number would you like to multiply by 5?"
number = gets.chomp

puts "The result is #{multiply_by_five(number)}!"
# when the user inputs 10 in the above code, expect the program to prnt "The result is 50!", but that's not the output why...
# Number needs to be converted into an integer, right now it's being read in as a string
def multiply_by_five(n)
  n * 5
end

puts "Hello! Which number would you like to multiply by 5?"
number = gets.chomp.to_i

puts "The result is #{multiply_by_five(number)}!"

#4. Pets
pets = { cat: 'fluffy', dog: ['sparky', 'fido'], fish: 'oscar' }

#pets[:dog] = 'bowser'

#p pets #=> {:cat=>"fluffy", :dog=>"bowser", :fish=>"oscar"}
# fix the code prior to the line p pets so that all 3 dogs' names are associated w/ the key :dog in the pets hash
pets[:dog] = ['sparky', 'bowser', 'fido'] #could also store the dog's names in a string instead of an array and set that as the value associated with the dog key
p pets

#alternatively could have done:
#pets[:dog].push('bowser')
#p pets

#5. Even Numbers
numbers = [5, 2, 9, 6, 3, 1, 8]

even_numbers = numbers.map do |n|
  n if n.even?
end

p even_numbers # expected output: [2, 6, 8]
#in the above code, want to iterate through #s array and return a new array 
# containing only the even numbers, but the code above doesn't do that.. why?
# the code above fills the odd values in the array with nil 
# instead of using map, should use select so that only the values that return true to .even?
# will be selected; also, don't need the if statement 
even_numbers = numbers.select do |n|
  n.even?    
end
p even_numbers


#6. Confucius Says
def get_quote(person)
  if person == 'Yoda'
    'Do. Or do not. There is no try.'
  end

  if person == 'Confucius'
    'I hear and I forget. I see and I remember. I do and I understand.'
  end

  if person == 'Einstein'
    'Do not worry about your difficulties in Mathematics. I can assure you mine are still greater.'
  end
end

#puts 'Confucius says:'
#puts '"' + get_quote('Confucius') + '"'

#above code returns error message: no implicit conversion of nil into String (TypeError)
# there are 3 if statements within the defined method
# the defined method will return nil every time an argument is entered that isn't Einstein
# therefore, nil can't be converted into a string in in the puts line that includes get_quote('Confucius')
# fixes = change the 3 if statements to an if ... elsif... else ... end statment 
# or add return key word to each line above

def get_quote(person)
  if person == 'Yoda'
    'Do. Or do not. There is no try.'
  elsif person == 'Confucius'
    'I hear and I forget. I see and I remember. I do and I understand.'
  elsif person == 'Einstein'
    'Do not worry about your difficulties in Mathematics. I can assure you mine are still greater.'
  end
end
puts 'Confucius says:'
puts '"' + get_quote('Confucius') + '"'

#7. Account Balance
# Financially, you started the year with a clean slate.

balance = 0

# Here's what you earned and spent during the first three months.

january = {
  income: [ 1200, 75 ],
  expenses: [ 650, 140, 33.2, 100, 26.9, 78 ]
}

february = {
  income: [ 1200 ],
  expenses: [ 650, 140, 320, 46.7, 122.5 ]
}

march = {
  income: [ 1200, 10, 75 ],
  expenses: [ 650, 140, 350, 12, 59.9, 2.5 ]
}

def calculate_balance(month)
  plus  = month[:income].reduce(&:+)
  minus = month[:expenses].reduce(&:+)

  plus - minus
end

[january, february, march].each do |month|
  balance = calculate_balance(month)
end

puts balance     #prints about $70
#why doesn't the code above print $238? it prints about $70 instead....
# the .each do that's written on the [january, february, march] array
# iterates the balance of each individual month and assigns each months' balance to balance
# so, when .each do is done iterating, balance is equal to the last month's balance
# not the total balance for all 3 months
# if want to add each month's balance together with each iteration should use += balance 

[january, february, march].each do |month|
  balance += calculate_balance(month)
end

puts balance #should print about $238

#8. Colorful Things
colors = ['red', 'yellow', 'purple', 'green', 'dark blue', 'turquoise', 'silver', 'black']
things = ['pen', 'mouse pad', 'coffee mug', 'sofa', 'surf board', 'training mat', 'notebook']

colors.shuffle!
things.shuffle!

i = 0
loop do
  break if i > colors.length

  if i == 0
    puts 'I have a ' + colors[i] + ' ' + things[i] + '.'
  else
    puts 'And a ' + colors[i] + ' ' + things[i] + '.'
  end

  i += 1
end

#the above code returns an error. find out what it is and explain why + how to fix it.
# if run the above code under #8. Colorful things, it does print out:
# " I have a <random_color_chosen_after_shuffling_the_colors_array> + <random_thing_chosen_after_shuffling_the_things array>."
#  " And a <color> <thing>." x6
# then an error prints stating that nil can't be converted into a string
# so, the loop works when i = 0 up through i = 6, but once i = 7, the loop breaks
# when examine the colors and things arrays closely, can see that colors.length = 8, so the loop doesn't break until i > 8
# if look at the indices and lengths of each array can see that the colors array has 7 indices, which is equivalent to 8 elements
# whereas the things array only has 6 indices and 7 elements. 
# accordingly, things[7] will return nil, which can't be converted to a string and that is the source of the error 
# if want to remove the error, should change the code to if i > 6 instead of i > colors.length
# code that won't error out:
i = 0
loop do
  break if i > 6

  if i == 0
    puts 'I have a ' + colors[i] + ' ' + things[i] + '.'
  else
    puts 'And a ' + colors[i] + ' ' + things[i] + '.'
  end

  i += 1
end


#9. Digit Product
def digit_product(str_num)
  digits = str_num.chars.map { |n| n.to_i }
  product = 0

  digits.each do |digit|
    product *= digit
  end

  product
end


p digit_product('12345') 
# expected return value: 120
# actual return value: 0
# asked to implement the digit_product method w/o using reduce or inject
# and want the method to multiply all the digits in the String
# what's wrong w/ the code and how can you fix it?

# the issue is with specifying the starting product value = 0 
# when multiply anything by 0 you will return zero and that's what the program is set-up to do
# each element within the digits string turned to integer will get multiplied to a variable 
# called product that is initially set to 0
# if change product = 0 to product 1, should fix the issue and get 120 to return

def digit_product(str_num)
  digits = str_num.chars.map { |n| n.to_i }
  product = 0

  digits.each do |digit|
    product *= digit
  end

  product
end

p digit_product('12345')  #should print 120

#10. Warriors and Wizards
# Each player starts with the same basic stats.

player = { strength: 10, dexterity: 10, charisma: 10, stamina: 10 }

# Then the player picks a character class and gets an upgrade accordingly.

character_classes = {
  warrior: { strength:  20 },
  thief:   { dexterity: 20 },
  scout:   { stamina:   20 },
  mage:    { charisma:  20 }
}

puts 'Please type your class (warrior, thief, scout, mage):'
input = gets.chomp.downcase

player.merge(character_classes[input])

puts 'Your character stats:'
puts player

#find and fix the problem w/ the above code
# the returned error message is that there is no implicit conversion of nil into Hash
# looking at merge documentation, I don't believe the merge method has been used properly 

#fixed code:
player = { strength: 10, dexterity: 10, charisma: 10, stamina: 10 }

# Then the player picks a character class and gets an upgrade accordingly.

character_classes = {
  warrior: { strength:  20 },
  thief:   { dexterity: 20 },
  scout:   { stamina:   20 },
  mage:    { charisma:  20 }
}

puts 'Please type your class (warrior, thief, scout, mage):'
input = gets.chomp.downcase.to_sym
#puts input.is_a?(Symbol) make sure .to_sym is valid and converts inputted string to a symbol
char_class_selected = character_classes[input]
#puts char_class_selected will print out desired hash that contains only the value from the character_classes 
# hash that corresponds with the user's input

player = player.merge(char_class_selected){|key, oldvalue, newvalue| newvalue }

puts 'Your character stats:'
puts player

#alternative solution:
# player = player.merge(character_classes[input.to_sym])