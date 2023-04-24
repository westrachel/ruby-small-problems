# print hello 10 times using a loop 

say_hello = true
counter = 0

while say_hello
  puts 'Hello!'
  counter += 1
  counter == 10 ? say_hello = false : "keep iterating"
end