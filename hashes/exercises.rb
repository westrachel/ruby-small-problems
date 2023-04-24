#Exercise 1:
#use select method on the given hash to gather only 
#immediate family members' names into a new array 

family = {  uncles: ["bob", "joe", "steve"],
            sisters: ["jane", "jill", "beth"],
            brothers: ["frank","rob","david"],
            aunts: ["mary","sally","susan"]
          }
#so, I want to gather all sisters and brothers values into one array 
bros_sis = family.select { |key, value|
   key == :sisters || key == :brothers
}
puts "#{bros_sis}" #examine output

immediate_fam = bros_sis.values.flatten #select only the values/names and combine bros and sis into one array
puts "#{immediate_fam}"
puts ""   #spacce out the execution of exercises

#Exercise 2:
#what is the difference between merge and merge!?
#merge! mutates the caller, whereas merge does not
# put differently, merge! will permanently merge the specified hash onto the hash preceding the dot operator and merge! method
# merge will simply return the merged hash without permanently modifiying the hash specified before the dot operator and merge method

#write a program tat illustrates the differences:
stem = { :math => "calculus", :science => "chemistry" }
arts = { :writing => "language & composition", :reading => "APUSH"}
puts "List of subjects and corresponding classes. Merge the arts and stem!:"
puts "#{stem.merge(arts)}"
puts "The original stem hash is unchanged: #{stem}"
puts ""     #make things a bit easier to read when executed
puts "List of subjects and corresponding classes. This time permanently merge the arts & stem."
puts "#{arts.merge!(stem)}"
puts "The original arts hash is no longer just the arts: #{arts}"
puts ""    #section break for readability print a space

#Exercise 3:
#write programs that:
#     i. loops through a hash and prints all keys
#     ii. loops through a hash and prints all values
#     iii. loops through a hash and prints all values
person = {name: 'Bob', occupation: 'web developer', hobbies: 'painting'}

puts "These are the keys in the person hash:"
person.each {|key, value|
  puts "#{key}"
}
#could also have used the each_key method

puts ""
puts "These are the values in the person hash:"
person.each {|key, value|
  puts "#{value}"
}

#could also have used the each_value method

puts ""
puts "These are the key-value pairs in the person hash:"
person.each {|key, value|
  puts "#{key}: #{value}"
}
puts ""


#Exercise 4:
#how would you access the name of the person?
person[:name]    #should return bob, the value/actual name associated with the name key 

#Exercise 5:
#what method can you use to find out if a hash contains a specific value?
# write a program to demonstrate this...
#solution:
#values = hash.values 
#values.include?(my_desired_value)

#solution in practice:
values = arts.values 
puts "#{values.include?("calculus")}" #will print true b/c calculus is included in the values of the arts hash
puts "#{values.include?("physics")}" #will print false b/c physics is not a value in the arts hash

#more succinctly, could use the has_value? method 

#Exercise 6:
x = "hi there"
my_hash = {x: "some value"}
my_hash2 = {x => "some value"}

#what is the difference between the 2 hashes that were created?
# my_hash uses a symbol as a key, which allows for using the newer ruby hash syntax where you have symbol: "value"
# my_hash2 uses a string as a key, which req useing the older ruby "rocket" syntax for 
##      assigning key pairs 

#Exercise 7:
# if you see this error, what do you suspect is the most likely problem?
# NoMethodError: undefined method `keys' for Array

#this is a multiple choice question:
# A. We're missing keys in an array variable.
# B. There is no method called keys for Array objects.
# C. keys is an Array object, but it hasn't been defined yet.
# D. There's an array of strings, and we're trying to get the string keys out of the array, but it doesn't exist.

# My answer: B b/c the error specifies that there was an undefined method called on an array

#Exercise 8:
words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']
#write a program that prints all the anagrams:
#can add to a hash with the store method, store(key, value)
sorted_word_and_orig_word = {} #empty hash
words.each { |word|
  sorted_word_and_orig_word.store(word, word.chars.sort.join)   #storing each word as its own key & it's jumbled alphabetically sorted word as the value 
     #word.chars.sort.join sorts the characters of each word and then joins the characters back into a jumbled alphabetical word
}

puts sorted_word_and_orig_word

#get list of all unique values 
unique_vals = sorted_word_and_orig_word.each_value.uniq
puts "There are #{unique_vals.count} different duplicates"

#empty arrays to push all annagrams into 
type_1_dup = []
type_2_dup = []
type_3_dup = []
type_4_dup = []
type_5_dup = [] 
sorted_word_and_orig_word.each do |k, v|  #want to compare each key's value to the 5 unique values in the unique list of sorted alphabetical words
  if v == unique_vals[0]                  # and push all the keys that have their values match up with one of the unique duplicates into one of the arrays
    type_1_dup << k 
  elsif v == unique_vals[1]
    type_2_dup << k 
  elsif v == unique_vals[2]
    type_3_dup << k 
  elsif v == unique_vals[3]
    type_4_dup << k
  else
    type_5_dup << k
  end
end

puts "#{type_1_dup}"
puts "#{type_2_dup}"
puts "#{type_3_dup}"
puts "#{type_4_dup}"
puts "#{type_5_dup}"
#in retrospect, this probably isn't the most efficient way to do this, but this is a working solution




  