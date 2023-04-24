flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

# find index of the first name that strats w/ Be

# solution:
index = 0
for name in flintstones do
  break if name[0, 2] == "Be"
  index += 1
end

p index

# simpler solution:
flintstones.index { |name| name[0, 2] == "Be" }
