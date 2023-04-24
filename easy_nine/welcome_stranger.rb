# Problem:
# Create a method that generates a greeting message based on the passed in arguments

# Example:
# greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })
# => Hello, John Q Doe! Nice to have a Master Plumber around.

# Data:
# Inputs:
#  > one array that contains 2 or more string elements
#      <=> the string elements create a person's full name when concatenated
#  > one hash w/ 2 key/value pairs
#     > one key/value pair = a key with the symbol value :title and a corresponding string value
#     > the 2nd key/value pair = a key w/ the symbol value :occupation and a corresponding string value
# Output:
#  > a string containing a greeting message that includes the person's full name and
#     their occuption
#  > not locked into only using "hello" "nice to have" in the outputted message
#     <=> assuming can switch to whatever message I want, as long as there is a greeting
#     <=> could technically shuffle between different greeting constants

# Algorithm:
# 1. establish a greeting constant that the defined method will sample from and integrate
#     into the first sentence of the method's returned string
# 2. establish a second constant that the defined method will sample from an use as
#       the start fo the second sentence of the method's returned string
#      <=> these sentence starters w/in the defined constant need to logically be able
#       to have someone's title and occupation added to the end of it
# 3. concatenate the sample from the constant in step 1 with all the string elements of
#        the passed in array and with the sample from the constant in step 2 and the
#        string values corresponding w/ the :title and :occupation keys of the passed in hash
# 4. print the concatenated string defined in step 3

# Code:
GREETINGS = ["Hi", "Hello", "Nice to see you", "Greetings"]
COMMENT = ["It's a pleasure to be in the presence of a ",
           "There is much wisdom to be learned from a ",
           "It must be fascinating to work as a "]

def greetings(arr, hsh)
  first_sentence = GREETINGS.sample + ', ' + arr.join(' ') + '!'
  second_sentence = COMMENT.sample + hsh[:title] + ' ' + hsh[:occupation] + '.'
  puts first_sentence + ' ' + second_sentence
end

# check work:
greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })
# => Nice to see you, John Q Doe! It's a pleasure to be in the presence of a Master Plumber.
greetings(['Jane', 'Q', 'Doe'], { title: 'Grandmaster', occupation: 'Pastry Chef' })
# => Hello, Jane Q Doe! There is much wisdom to be learned from a Grandmaster Pastry Chef.

# Further exploration:
# shorten the method to ensure no lines exceed 80 maximum characters,
# which ensures rubocop won't have 
def greet(arr, hsh)
  first = GREETINGS.sample + ", #{arr.join(' ')}!"
  second = COMMENT.sample + "#{hsh[:title]} #{hsh[:occupation]}."
  puts first + ' ' + second
end

# check work:
greet(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })
# => Hello, John Q Doe! There is much wisdom to be learned from a Master Plumber.
greet(['Jane', 'Q', 'Doe'], { title: 'Grandmaster', occupation: 'Pastry Chef' })
# => Greetings, Jane Q Doe! It must be fascinating to work as a Grandmaster Pastry Chef.