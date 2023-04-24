# can assume only valid numbers are entered

def sign_of_num(string_num)
  if string_num[0] == "-"
    sign = -1
  else
    sign = 1
  end
end

def scrubbed_string_num(string_number)
  if string_number[0] == "-" || string_number[0] == "+" 
    string_number = string_number.delete(string_number[0]) # remove leading negative or positive sign from the number
  else
    string_number
  end
end

def string_to_signed_integer(str)
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
  str_arr = scrubbed_string_num(str).split("")
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
  summation * (sign_of_num(str))
end

# check work:
puts string_to_signed_integer('4321') == 4321
puts string_to_signed_integer('-570') == -570
puts string_to_signed_integer('+100') == 100

# Further exploration:
DIGITS = {
  '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4,
  '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9
}

def string_to_integer(string)
  digits = string.chars.map { |char| DIGITS[char] }

  value = 0
  digits.each { |digit| value = 10 * value + digit }
  value
end

def string_to_signed_integer(string)
  factor = 0
  string[0] == "-" ? factor -= 1 : factor += 1
  factor * string_to_integer(string.delete_prefix("+").delete_prefix("-"))
end

# check work:
puts string_to_signed_integer('4321') == 4321
puts string_to_signed_integer('-570') == -570
puts string_to_signed_integer('+100') == 100
