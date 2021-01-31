# assume valid integer input w/o any signs (so positive)

CONVERTER = {0 => "0", 1 => "1", 2 => "2", 3 => "3", 4 => "4", 
             5 => "5", 6 => "6", 7 => "7", 8 => "8", 9 => "9"}

def integer_to_string(int)
  str = ""
  int.digits.each {|key| str += CONVERTER[key] }
  str.reverse
end

# check work:
puts integer_to_string(4321) == '4321'
puts integer_to_string(0) == '0'
puts integer_to_string(5000) == '5000'