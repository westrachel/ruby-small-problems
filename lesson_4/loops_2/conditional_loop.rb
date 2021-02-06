process_the_loop = [true, false].sample

# create loop that prints loop was processed 1 time
# if the sample returns true 

if process_the_loop
  loop do
    puts "The loop was processed!"
    break
  end
else
  puts "The loop wasn't processed!"
end