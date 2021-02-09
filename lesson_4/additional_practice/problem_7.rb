statement = "The Flintstones Rock"

# make a hash that indicates the frequency that each letter occurs in the above string
# I'm assuming case sensitivity applies meaning that T != t, so there should be two different 
# key-value pairs for indicating the frequency of T and the frequency of t separately

# solution 1:
hash = {}
statement.chars.each do |character|
  hash[character] = statement.chars.count(character)
end

# check work:
p hash
