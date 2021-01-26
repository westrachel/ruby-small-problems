munsters_description = "The Munsters are creepy in a good way."

# convert the string in the following ways:
# "tHE mUNSTERS ARE CREEPY IN A GOOD WAY."
# "The munsters are creepy in a good way."
# "the munsters are creepy in a good way."
# "THE MUNSTERS ARE CREEPY IN A GOOD WAY."

# First conversion
munsters_description.upcase!
munsters_description[0] = munsters_description[0].downcase
munsters_description[4] = munsters_description[4].downcase
# check work
puts munsters_description

# alternative would have been to use #swapcase!

# Second conversion
munsters_description = "The Munsters are creepy in a good way."
munsters_description.capitalize!
# check work
puts munsters_description

# Third conversion 
munsters_description = "The Munsters are creepy in a good way."
munsters_description.downcase!
# check work
puts munsters_description

# Fourth conversion
munsters_description = "The Munsters are creepy in a good way."
munsters_description.upcase!
# check work
puts munsters_description
