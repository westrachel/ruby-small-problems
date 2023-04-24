def real_palindrome?(str)
  str_scrubbed = str.gsub(/[^0-9a-z]/i, "")
  str_scrubbed.downcase == str_scrubbed.downcase.reverse
end

# check work:
puts real_palindrome?('madam') # should return true
puts real_palindrome?('Madam') # should return true b/c case doesn't matter
puts real_palindrome?("Madam, I'm Adam") # should return true only alphanumerics matter
puts real_palindrome?('356653') # should return true
puts real_palindrome?('356a653') # should return true
puts real_palindrome?('123ab321') # should return false 