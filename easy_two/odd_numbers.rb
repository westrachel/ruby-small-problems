# Print all odd numbers from 1 to 99, inclusive, to the console w/ each # on a separate line
# times starts at 0, so first iteration will print nothing <=> will need to iterate 100 times
100.times {|counter| puts counter if counter % 2 == 1 }

#Further Exploration:
#alternative solution that tries to incorporate the inclusive dot operator
odds_only = (1..99).to_a.select { |num| num.odd? }
odds_only.each { |odd_num| puts odd_num }

