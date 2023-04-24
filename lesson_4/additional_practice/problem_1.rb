# turn the given array into a hash
# the keys should be the names/elements of the given array
# and the values should be the positions in the array
# I'm going to assume that position = index + 1, so that the 
# 1st element/name of the array (which corresponds to the 0th index) 
# corresponds to position 1
# I'm also assuming that I don't need to destructively change the 
# given array into a hash, so I'm going to return a new hash
# and leave the original flintstones array unchanged

flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

# solution 1:
counter = 0
name_hash = flintstones.each_with_object({}) do |name, hash|
  counter += 1
  hash[name] = counter
end

# check work:
p name_hash

# solution 2: (old school w/ for loop)
names_hash = {}
position = 1
for name in flintstones do
  names_hash[name] = position
  position += 1
end

p names_hash

# alternative solution 3:
flint_hash = {}
flintstones.each_with_index do |character_name, idx|
  flint_hash[character_name] = idx
end
