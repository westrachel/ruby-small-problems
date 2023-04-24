def multisum(number)
  sum_these_elements = []
  (1..number).to_a.each do |num|
    sum_these_elements << num if num % 3 == 0 || num % 5 == 0
  end
  total_sum = 0 
  sum_these_elements.each do |selected_num|
    total_sum += selected_num
  end
  total_sum
end

# check work:
puts multisum(3) == 3
puts multisum(5) == 8
puts multisum(10) == 33
puts multisum(1000) == 234168

# further exploration:
def multiple?(num, divisor)
  num % divisor == 0
end

def multisum(upper_bound)
  sum_these_els = (1..upper_bound).to_a.select do |num|
    multiple?(num, 3) || multiple?(num, 5)
  end
  sum_these_els.reduce(:+)
end

# check work:
puts multisum(3) == 3
puts multisum(5) == 8
puts multisum(10) == 33
puts multisum(1000) == 234168
  