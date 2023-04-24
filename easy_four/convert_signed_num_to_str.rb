# assume valid integer input w/o any signs (so positive)

CONVERTER = {0 => "0", 1 => "1", 2 => "2", 3 => "3", 4 => "4", 
             5 => "5", 6 => "6", 7 => "7", 8 => "8", 9 => "9"}

def integer_to_string(int)
  str = ""
  int.digits.each {|key| str += CONVERTER[key] }
  str.reverse
end

def signed_integer_to_string(integ)
  if integ > 0
    prefix = "+"
  elsif integ < 0
    prefix = "-"
  else
    prefix = ""
  end
  prefix + integer_to_string(integ.abs) 
  #abs should remove the negative / positive signs before passing integ into the defined integer to string method
end

# check work:
puts signed_integer_to_string(4321) == '+4321'
puts signed_integer_to_string(-123) == '-123'
puts signed_integer_to_string(0) == '0'