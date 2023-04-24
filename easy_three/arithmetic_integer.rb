def num_request(num)
  puts "==> Enter the #{num} number:"
end

def operation(num1, num2)
  puts "==> #{num1} + #{num2} = #{num1 + num2}"
  puts "==> #{num1} - #{num2} = #{num1 - num2}"
  puts "==> #{num1} * #{num2} = #{num1 * num2}"
  puts "==> #{num1} / #{num2} = #{num1 / num2}"
  puts "==> #{num1} % #{num2} = #{num1 % num2}"
  puts "==> #{num1} ** #{num2} = #{num1 ** num2}"
end

num_request("first")
int1 = gets.chomp.to_i

num_request("second")
int2 = gets.chomp.to_i

operation(int1, int2)

#use floats instead of integers & require nonzero inputs
num_request("first")
float1 = gets.chomp.to_f

while float1.to_i == 0 
  puts "please enter a nonzero number"
  float1 = gets.chomp.to_f
end 

num_request("second")
float2 = gets.chomp.to_f

while float2.to_i == 0 
  puts "please enter a nonzero number"
  float2 = gets.chomp.to_f
end 

operation(float1, float2)



  
