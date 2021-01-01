#Exercise 1:
#use each method to iterate over the array and print out each value 
puts "Exercise 1"
array = []
1.upto(10) { |int| array << int } #avoid typing out 1..10 into an array and practice using .upto
array.each do |array_element|
  puts "#{array_element}"
end
puts ""

#Exercise 2:
puts "Exercise 2: Print values > 5"
b = []
array.each { |int|
  if int > 5
    puts "#{int}"
    b << int
  end
}
puts ""

#Exercise 3:
puts "Exercise 3: select & print all odd values from array establish in ex 2"
b = b.select { |int| int % 2 != 0 }
puts b 
puts ""

#Exercise 4:
puts "Exercise 4: Append 11 to the original array. Prepend 0 to the beginning"
array << 11 #adds 11 to the end
array.unshift(0) #adds 0 to the beginning of the array before 1
p array
puts ""

#Exercise 5:
puts "Exercise 5: Replace 11 with 3"
array.pop #removes permanently the last element of the array
array.push(3) #different way of pushing an element to an array
puts array
puts ""

#Exercise 6:
puts "Exercise 6: Remove duplicates w/o specifying any particular value"
array.uniq! #permanently mutates the caller
puts array
puts ""

#Exercise 7:
#what is the main difference between an array and a hash?
# An array is a list of elements where each element can be called based on its numbered index
# in contrast a hash contains key-value pairs, so that a value can be called based on its associated key 


#Exercise 8:
#Create a hash w/ both syntaxes
#old syntax w/ the rocket:
hash1 = {"Texas" => "Austin",
  "Illinois" => "Chicago",
  "Arizona" => "Phoenix"
} 
#new syntax
hash2 = { California: "San Diego",
  Masachusetts: "Boston",
  Idaho: "Boise"
}

#Exercise 9:
hash = {a:1, b:2, c:3, d:4}
#(part 1) get the value of key :b
hash[:b]

#(part 2) add to this hash the key:value pair '{e:5}'
hash[:e] = 5

#(part 3) remove all key:value pairs whose value is less than 3.5
hash.each do |key, val|
  if val < 3.5
    hash.delete(key)
  end
end

#Exercise 10:
#Can hash values be arrays?
#yes, I believe so
puts "Exercise 10:"
one = [1, 2, 3]
two = [4, 5, 6]
hash_with_array_vals = {arr1: one,
  arr2: two
}
puts "Look at this hash w/ arrays as values: #{hash_with_array_vals}"
#can you have an array of hashes?
# yes
array_of_hashes = [hash1, hash2]
puts "Look at this array of hashes: #{array_of_hashes}"
puts ""

#Exercise 11:
#write a program that copies the info from the array into the empty hash that applies
# to the correct person
puts "Exercise 11: manipulating arrays and hashes"
contact_data = [["joe@email.com", "123 Main st.", "555-123-4567"],
            ["sally@email.com", "404 Not Found Dr.", "123-234-3454"]]

contacts = {"Joe Smith" => {}, "Sally Johnson" => {}}

# Expected output:
#  {
#    "Joe Smith"=>{:email=>"joe@email.com", :address=>"123 Main st.", :phone=>"555-123-4567"},
#    "Sally Johnson"=>{:email=>"sally@email.com", :address=>"404 Not Found Dr.",  :phone=>"123-234-3454"}
#  }

#write program to get desired output:
#manual assignment: 
# what am I trying to do: want to turn the given data array into a hash and store that hash as the value for each person in the already existing hash
#turn array into hash:
#in irb, tried contact_data[0][0] to make sure it returns joe's email
joe_info_hash = {:email =>  contact_data[0][0],
  :address => contact_data[0][1],
  :phone => contact_data[0][2]
}

sally_info_hash = {:email =>  contact_data[1][0],
  :address => contact_data[1][1],
  :phone => contact_data[1][2]
}
#assign created hashes as values to respective keys
contacts["Joe Smith"] = joe_info_hash #setting first indexed item in the contact_data array to the joe smith key
contacts["Sally Johnson"] = sally_info_hash
puts contacts   #returns desired result

#alternative solution that avoids creating interim hashes:
contacts["Joe Smith"][:email] = contact_data[0][0]
contacts["Joe Smith"][:address] = contact_data[0][1]
contacts["Joe Smith"][:phone] = contact_data[0][2]
contacts["Sally Johnson"][:email] = contact_data[1][0]
contacts["Sally Johnson"][:address] = contact_data[1][1]
contacts["Sally Johnson"][:phone] = contact_data[1][2]
puts ""

#Exercise 12:
#Using the hash you created from the previous exercise, 
# demonstrate how you would access Joe's email and Sally's phone number?
puts "Exercise 12: practice accessing hash values"
puts contacts["Joe Smith"][:email]      #should print out Joe's email
puts contacts["Sally Johnson"][:phone]  #should print sally's phone #
puts ""

#Exercise 13:
#Use Ruby's Array method delete_if and String method start_with? to 
# delete all of the words that begin with an "s" in the following array.
arr = ['snow', 'winter', 'ice', 'slippery', 'salted roads', 'white trees']
arr.delete_if { |word| word.start_with?('s') }


#Exercise 14:
#given array:
a = ['white snow', 'winter wonderland', 'melting ice',
     'slippery sidewalk', 'salted roads', 'white trees']

#turn given array into a new array that consists of strings containing one word. 
#(ex. ["white snow", etc...] → ["white", "snow", etc...]. 
#Look into using Array's map and flatten methods, as well as String's split method.
b = [] 
a.map { |string| b << string.split }
#in irb, b prints as an array w/ multiple arrays in it:
#=> [["white", "snow"], ["winter", "wonderland"], ["melting", "ice"], ["slippery", "sidewalk"], ["salted", "roads"], ["white", "trees"]] 
#based on ruby documentation, flatten returns a one-d array of itself 
# returning is not the same as mutating permanently, so set b = b.flatten to permanenty change b
b = b.flatten


#Exercise 15:
#what will the following return?
puts "Exericse 15: test hashes for equivalency"
hash1 = {shoes: "nike", "hat" => "adidas", :hoodie => true}   #hash with both strings and symbols as keys
hash2 = {"hat" => "adidas", :shoes => "nike", hoodie: true}  #different order than hash1, but the types are the same 
# types are the same in that each key in hash1 is of the same type as in hash2 ("hat" = string key in both and identical spelling + all lowercase)
# conclusion: only the order is different, but otherwise the hashes appear equivalent, so 
#                 I expect the code below to print "These hashes are the same!"

if hash1 == hash2
  puts "These hashes are the same!"
else
  puts "These hashes are not the same!"
end


#Exercise 16:
#Challenge: In exercise 11, we manually set the contacts hash values one by one.
#Now, programmatically loop or iterate over the contacts hash from exercise 11, 
#and populate the associated data from the contact_data array. Hint: you will probably need to iterate over 
# ([:email, :address, :phone]), and some helpful methods might be the Array shift and first methods.
contact_data = ["joe@email.com", "123 Main st.", "555-123-4567"]
contacts = {"Joe Smith" => {}}

#solution:
#in irb, when used .shift on contact_data it permanently deleted the first element of contact_data
contact_info = { :email => "", 
  :address => "" ,
  :phone => "" }
  
contact_info.each do |k, v|
  v << contact_data.first
  contact_data.shift  #this should remove the first element of contact_data permanently, so that on each subsequent iteration 
end                   # a different element of contact_data will be assigned to a subsequent value in contact_info

#now assign contact_info hash as the value to "Joe Smith" in the original contacts hash
contacts["Joe Smith"] = contact_info 


#Exercise 16 bonus: see if you can figure out how to make it work with multiple entries in the contacts hash.
#try to get a more automated way of completing exercise 16 pre-bonus w/ 1 contact 
# <=> avoid assigning each contact_data item to a manually created hash w/ keys :email, :address, :phone 
contact_data = ["joe@email.com", "123 Main st.", "555-123-4567"]
contacts = {"Joe Smith" => {}}
info_types = [:email, :address, :phone]

contacts.each do |og_hash_key, og_hash_value|  # only one key in the original hash = joe smith 
  info_types.each do |info_type|       # for each type of info we want to assign to a hash, we want the info_type (= email, phone, etc) to be the key
    og_hash_value[info_type] = contact_data.shift  #.shift should allow for iterating through contact_data
  end
end

contact_data = [["joe@email.com", "123 Main st.", "555-123-4567"],
            ["sally@email.com", "404 Not Found Dr.", "123-234-3454"]]

contacts = {"Joe Smith" => {}, "Sally Johnson" => {}}
info_types = [:email, :address, :phone]

#examine .each_with_index method results in irb
#contacts.each_with_index do |(og_hash_key, og_hash_value), index|
#  puts "key: #{og_hash_key}, value: #{og_hash_value}, index: #{index}"       
#end        <=> so Joe Smith key has empty hash value and is index 0 & sally johnson key is index 1 and also has empty hash

contacts.each_with_index do |(og_hash_key, og_hash_value), index|
  info_types.each do |info_type|
    og_hash_value[info_type] = contact_data[index].shift      #contact_data has 2 arrays at each of its indexes 
  end                                                         # since the joe key's index in contacts corresponds to the joe array index w/in the contacts_data array
end                                                           # can use the index of the contacts hash to specify where to pull info from w/in contact_data 