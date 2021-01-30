# string comparison:
def palindrome?(str)
  str == str.reverse 
end

# check work:
puts palindrome?('madam') # should return true 
puts palindrome?('Madam') # should return false b/c case matters
puts palindrome?("madam i'm adam") # should return false b/c all characters matter
puts palindrome?('356653') # should return true

# further exploration: array or string input
# reverse method can be called on both arrays and strings
def palindrome?(arr_or_str)
    arr_or_str == arr_or_str.reverse 
end
puts palindrome?(["a", "b", 4, 4, "b", "a"]) # should return true 
puts palindrome?(["Mad", "mad"]) # should return false b/c case matters
puts palindrome?(["madam", "i'm", " madam"]) # should return false b/c all characters matter

puts palindrome?('madam') # should return true 
puts palindrome?('Madam') # should return false b/c case matters
puts palindrome?("madam i'm adam") # should return false b/c all characters matter
puts palindrome?('356653') # should return true

# further exploration: do it a different way
# want to push each character of the original string to an array 
# then push each character of the original string reversed to an array
# for the same index in each array, compare case/contents of each array for equivalency
def palindrome?(str)
  orig_str_arr = str.split("")
  reversed_str_arr = str.reverse.split("")
  mismatch_indicator = 0
  reversed_str_arr.each_index do |idx| 
    reversed_str_arr[idx] != orig_str_arr[idx] ? mismatch_indicator += 1 : "do nothing"
  end
  mismatch_indicator > 0 ? false : true 
end

# check work:
puts palindrome?('madam') # should return true 
puts palindrome?('Madam') # should return false b/c case matters
puts palindrome?("madam i'm adam") # should return false b/c all characters matter
puts palindrome?('356653') # should return true
