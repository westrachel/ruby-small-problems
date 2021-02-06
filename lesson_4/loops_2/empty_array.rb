# create loop to remove and print each name
names = ['Sally', 'Joe', 'Lisa', 'Henry']

until names.empty?
  puts "#{names[names.length-1]}"
  names.pop
end

# alternative solution:
names = ['Sally', 'Joe', 'Lisa', 'Henry']

until names.empty?
  puts "#{names.last}"
  names.pop
end
