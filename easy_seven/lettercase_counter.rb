# Problem:
# Create a method that takes a string and counts the number of capitalized alphabetical characters,
#   the number of lowercased alphabetical characters, and the number of non-alphabetical characters
#   in the passed in string and then returns these values in a hash. These counts are the values in the
#   3 key-value pairs of the returned hash.

# Examples:
# letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
# letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
# letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
# letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }

# Data:
# Input:
#  > String
# Output:
#  > Hash w/ 3 key-value pairs:
#      > lowercase symbol key whose value should be the # of lowercase alphabetical letters in the passed in string
#      > uppercase symbol key whose value should be the # of uppercase alphabetical letters in the passed in string
#      > neither symbol key whose value should be the # of non-alphabetical characters in the passed in string

# Algorithm:
# i. Initialize a hash within the method with the three key symbols (lowercase, uppercase, and neither) that
#      have initial values set to zero
# ii. Turn the passed in string into an array of characters
# iii. Iterate through the array of characters and check
#          > first, if the character matches any uppercased English alphabetical letters
#              > if it does, then add 1 to the current value associated w/ the count_hsh's :uppercase key
#          > if the first check doesn't return a truthy value, then check if character matches a lowercase
#                English alphabetical letter
#              > if it does, then add 1 to the current value associated w/ the count_hsh's :lowercase key
#          > if the first two checks don't return truthy values and therefore the values associated w/
#                the :lowercase and :uppercase keys haven't been changed, then the character must be
#                a non_letter, and thus add 1 to the current value associated w/ the count_hsh's :neither key

def letter_case_count(string)
  count_hsh = { lowercase: 0, uppercase: 0, neither: 0 }
  string.chars.each do |character|
    if character.match(/[A-Z]/)
      count_hsh[:uppercase] += 1
    elsif character.match(/[a-z]/)
      count_hsh[:lowercase] += 1
    else
      count_hsh[:neither] += 1
    end
  end
  count_hsh
end

# Check Work:
p letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
# => true
p letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
# => true
p letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
# => true
p letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }
# => true
