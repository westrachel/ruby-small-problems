# use range object to determine if 42 lies between 10 and 100
puts "Does 42 lie between 10 and 100 inclusive?"
if (10..100).include?(42)
  puts "yes"
else 
  puts "no"
end