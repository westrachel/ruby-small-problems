# Problem:
# Create a method that takes in one string word and returns a boolean that
# denotes whether or not the word passed in can be spelled by letters from
# the constant letter blocks below

# Requirements:
#   > words can be spelled using only one letter of a block, not both
#   > blocks can't be repeated
#      <=>so, if the same letter is repeated twice then the method should return false

LETTER_BLOCKS = [["B", "O"], ["X", "K"], ["D", "Q"],
                 ["C", "P"], ["N", "A"], ["G", "T"],
                 ["R", "E"], ["F", "S"], ["J", "W"],
                 ["H", "U"], ["V", "I"], ["L", "Y"],
                 ["Z", "M"]]

# Examples:
# block_word?('BATCH') == true
# block_word?('BUTCH') == false
# block_word?('jest') == true

# Data:
# Input:
# > string containing one word that can be lowercased or uppercased
# <=> assuming inputted words = valid and not checking for #s other characters, but this wouldn't impede the function
#  from checking valid character usages

# Output:
# > boolean true or false

# Algorithm:
# 1. Split the inputted string word into individual letter characters
# 2. Check if any letter character is repeated twice
#     > if a letter character is repeated twice return false
# 3. Initialize a counter variable that initially points to the value 0
# 4. Loop through each letter block and check if both letters within one
#      block are present in the string word 
#    > captialize the string word befor checking this, the match
#       doesn't have to be case sensitive
#    > if both letters are present add 1 to the counter variable's value
#    > break the loop if the counter >= 1
# 5. return false if the counter variable's value is >= 1
# 6. Otherwise return true

# Code:
def block_word?(str)
  counter = 0
  idx = 0
  until idx == (LETTER_BLOCKS.size - 1)
    mini_counter = 0
    mini_counter += 1 if str.upcase.include?(LETTER_BLOCKS[idx][0])
    mini_counter += 1 if str.upcase.include?(LETTER_BLOCKS[idx][1])
    counter += 1 if mini_counter == 2
    idx += 1
    break if counter >= 1
  end
  if counter >= 1
    false
  elsif str.split('').uniq.length != str.length
    false
  else
    true
  end
end

# check work:
p block_word?('BATCH') == true
# => true
p block_word?('BUTCH') == false
# => true
p block_word?('jest') == true
# => true
