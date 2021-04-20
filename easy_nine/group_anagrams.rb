# Problem:
# Create a program that takes one argument input (an array of strings) and
#  outputs array(s) containing all string anagrams present in the inputted array

# Example:
# words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
#           'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
#           'flow', 'neon']

# output:
# ["demo", "dome", "mode"]
# ["neon", "none"]
# (etc)

# Data:
# Input:
#  > an array of strings
# Output:
#  > printed arrays that contain string elements
#     > all string elements in one of the outputted arrays should be anagrams

# Anagrams = words containing identical letters in different orders

# Algorithm:
# 1. initialize an empty hash that the variable anagrams points to
# 2. remove duplicates from the words array (if there are any)
# 3. iterate over the array containing unique strings and with each iteration:
#     i. split the string being iterated over into an array of single characters
#     ii. sort the array of characters
#     iii. join the sorted characters together to create a sorted string
#     iv. push the sorted string as a key to the hash created in step 1 and have this
#           key's corresponding value be an empty array
#       <=> so pushing a string key and an empty array value to the hash created in step 1
# 4. iterate over the array containing unique strings again and with each iteration
#    i. find the key in the anagrams hash that corresponds w/ the string's sorted characters
#    ii. push to the array value corresponding with the key found in step 4i., the unique value
#         of the string currently being iterated over
# 5. Print each value of the created hash

# Code:
anagrams = {}

words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']

unique_wds = words.uniq

unique_wds.each do |word|
  anagrams[word.chars.sort.join('')] = []
end

unique_wds.each do |word|
  anagrams[word.chars.sort.join('')] << word
end

# check created anagrams hash:
p anagrams
# => {"demo"=>["demo", "dome", "mode"], 
#     "enno"=>["none", "neon"], 
#     "deit"=>["tied", "diet", "edit", "tide"], 
#     "eilv"=>["evil", "live", "veil", "vile"], 
#     "flow"=>["fowl", "wolf", "flow"]}

# <=> output is as intended:
#     > each key in the anagrams hash represents that anagram's group sorted characters string
#     > each value is an array containing all word strings that are anagrams

# print each anagram group:
anagrams.each_value { |v| p v }
# => ["demo", "dome", "mode"]
#    ["none", "neon"]
#    ["tied", "diet", "edit", "tide"]
#    ["evil", "live", "veil", "vile"]
#    ["fowl", "wolf", "flow"]
