# replace the word "important" with "urgent" in the following string:
advice = "Few things in life are as important as house training your pet dinosaur."
puts advice
advice = advice.split(' ') # turn into an array and split at each instance of a space character, so that each word is its own element in the array
advice[6] = "urgent"

advice = advice.join(' ')
# check work
puts advice

# alternative: use #gsub