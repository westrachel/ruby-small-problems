# Mutate the array so that the names are all shortened to the first 3 characters
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

# solution 1:
# map returns a new array, so to mutate the given array new to reassign it
#     to the return value of the map method invocation w/ a block
flintstones = flintstones.map do |name|
  name[0, 3]
end

p flintstones

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
# solution 2: there is a destructure version of map
flintstones.map! do |name|
  name[0, 3]
end

p flintstones
