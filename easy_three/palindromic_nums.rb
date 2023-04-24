def palindromic_number?(num)
  num.to_s == num.to_s.reverse
end

puts palindromic_number?(34543) #should return true
puts palindromic_number?(123210) #should return false
puts palindromic_number?(22) #should return true
puts palindromic_number?(5) #should return true

# Further Exploration:
# method won't work if there are >= 1 zero's at the beginning but
# the actual number after the zeros is a palindrome
puts palindromic_number?('00121') # returns false

# 00121 when inputted into irb retursn 81 & 00121.to_s = "81"
# so, if have leading zeros inputted it will need to be in string format

def palindromic_number?(str_num)
  arr_str_num = str_num.split("")
  # want to identify the first index where the number at that index in the array is not zero
  index = 0 
  while arr_str_num[index] == "0"
    arr_str_num.shift # remove leading zeros
  end
  arr_str_num == arr_str_num.reverse
end

puts palindromic_number?('00121') # should now return true