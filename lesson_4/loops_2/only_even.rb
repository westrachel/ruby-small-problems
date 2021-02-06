# use next to edit code so that it only prints even numbers
number = 0

until number == 10
  number += 1
  next if number.odd?
  puts number
end