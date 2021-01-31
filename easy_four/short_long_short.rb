def short_long_short(str1, str2)
  str1.length > str2.length ? first_is_longer_flag = 1 : first_is_longer_flag = 0
  case first_is_longer_flag
  when 1 
    str2 + str1 + str2
  when 0 
    str1 + str2 + str1
  end
end

# check work: all of the below should print true
puts short_long_short('abc', 'defgh') == "abcdefghabc"
puts short_long_short('abcde', 'fgh') == "fghabcdefgh"
puts short_long_short('', 'xyz') == "xyz" 


# shorten method:
def short_long_short(str1, str2)
  str1.length > str2.length ? str2 + str1 + str2 : str1 + str2 + str1
end

# check work: all of the below should print true
puts short_long_short('abc', 'defgh') == "abcdefghabc"
puts short_long_short('abcde', 'fgh') == "fghabcdefgh"
puts short_long_short('', 'xyz') == "xyz" 