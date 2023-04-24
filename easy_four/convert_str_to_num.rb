# assuming all characters entered = numeric
# and currently not building in functionality for +/- 

def string_to_integer(str)
  str_to_num_converter_hash = {"0" => 0,
                               "1" => 1,
                               "2" => 2,
                               "3" => 3,
                               "4" => 4,
                               "5" => 5,
                               "6" => 6,
                               "7" => 7,
                               "8" => 8,
                               "9" => 9}
  str_arr = str.split("")
  desired_values = []
  str_arr.select {|key| desired_values << str_to_num_converter_hash[key] }
  summation = 0
  index = 0
  exponent = desired_values.length
  while index < desired_values.length
    exponent -= 1
    summation += desired_values[index] * (10 ** exponent)
    index += 1
  end
  summation
end

# check work:
puts string_to_integer('4321') == 4321
puts string_to_integer('570') == 570