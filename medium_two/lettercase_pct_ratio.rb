# Problem:
# Create a method that accepts one string argument and returns a hash
# w/ 3 key/value pairs:
#    i. lowercase: <percentage of characters that = lowercase letters as a number>
#    ii. uppercase: <percentage of characters that = uppercase letters as a number>
#    iii. neither: <percentage of characters that are not letters denoted as a number?

# Examples:
# letter_percentages('abCdef 123') == { lowercase: 50, uppercase: 10, neither: 40 }
# letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25 }
# letter_percentages('123') == { lowercase: 0, uppercase: 0, neither: 100 }

# Data:
# Input:
#  > a string containing spaces, letters, #s, punctuation and other symbols
#  > string always contains at least 1 character
#     <=> so don't have to worry about dividing by zero case if an empty string were passed in

# Output: hash w/ 3 key value pairs
#     > I'm assuming percentage values don't need to be rounded to a certain number of decimal places
#       <=> 37.5 is not rounded up and that's the only example to go off of (but 37.5 also only has 1 decimal place)

# Algorithm:
# 1. Initialize a variable that points to the value of the length of the passed in string
# 2. Initialize a lowercase letter count variable that points to the value zero to start
# 3. Initialize an uppercase letter count variable that points to the value zero to start
# 4. Initialize an other count variable that points to the value zero to start
# 5. loop through each character of the inputted string and check if the character is an uppercased
#    letter, a lowercased letter, or neither
#      i. if there's a match and that character is a lowercased letter then add 1 to the lowercased
#           letter count variable
#      ii. if the character is an uppercased letter then add 1 to the uppercased letter count
#           variable
#      iii. if the character does not match as an uppercased or lowercased letter then add 1 to the other variable
# 6. Create a hash and push 3 key/value pairs to it:
#       i. push a lowercase symbol as a key associated w/ the value of the lowercased letter count variable
#              divided by the length of the inputted string times 100
#           => adjust the percentage value, so that if it's a whole number after multiplying by 100 that there
#                are no decimals shown (ie should not assign 50.0 as a value to a key)
#       ii. push an uppercase symbol as a key associated w/ the value of the uppercased letter count variable
#              divided by the length of the inputted string times 100
#           => adjust the percentage value, so that if it's a whole number after multiplying by 100 that there
#                are no decimals shown (ie should not assign 50.0 as a value to a key)
#      iii. push a neither symbol as a key associated w/ the value of the other count variable
#              divided by the length of the inputted string times 100
#           => adjust the percentage value, so that if it's a whole number after multiplying by 100 that there
#                are no decimals shown (ie should not assign 50.0 as a value to a key)

# Code:
def percentify(num, denom)
  pct = num.to_f / denom.to_f * 100
  pct_arr = pct.to_s.chars
  slice_start = (pct_arr.find_index(".")) + 1
  decimals = pct_arr[slice_start, (pct_arr.size - 1)]
  if decimals.all? {|x| x == "0" }
    pct.to_i
  else
    pct
  end
end

def letter_percentages(str)
  size = str.length.to_f
  uppercase_count = 0
  lowercase_count = 0
  other_count = 0
  str.split('').each do |char|
    if char =~ /[a-z]/
      lowercase_count += 1
    elsif char =~ /[A-Z]/
      uppercase_count += 1
    else
      other_count += 1
    end
  end
  hsh = {}
  hsh[:lowercase] = percentify(lowercase_count, size)
  hsh[:uppercase] = percentify(uppercase_count, size)
  hsh[:neither] = percentify(other_count, size)
  hsh
end

# check work:
p letter_percentages('abCdef 123') == { lowercase: 50, uppercase: 10, neither: 40 }
# => true
p letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25 }
# => true
p letter_percentages('123') == { lowercase: 0, uppercase: 0, neither: 100 }
# => true

# Further Exploration:
# refactor above letter_percentages method definition
def create_pct_hsh
  hsh = {:lowercase => 0,
         :uppercase => 0,
         :neither => 0}
  hsh
end

def push_counts_to_hsh(string, a_hash)
  string.split('').each do |char|
    if char =~ /[a-z]/
      a_hash[:lowercase] += 1
    elsif char =~ /[A-Z]/
      a_hash[:uppercase] += 1
    else
      a_hash[:neither] += 1
    end
  end
  a_hash
end

def letter_percentages(str)
  size = str.length.to_f
  hsh = push_counts_to_hsh(str, create_pct_hsh)
  hsh[:lowercase] = percentify(hsh[:lowercase], size)
  hsh[:uppercase] = percentify(hsh[:uppercase], size)
  hsh[:neither] = percentify(hsh[:neither], size)
  hsh
end

# check work:
p letter_percentages('abCdef 123') == { lowercase: 50, uppercase: 10, neither: 40 }
# => true
p letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25 }
# => true
p letter_percentages('123') == { lowercase: 0, uppercase: 0, neither: 100 }
# => true


# Further Exploration:
# adapt method, so that if the percentage float number rounds decimals to
#  two places and at a minimum one decimal place

# example:
p letter_percentages('abcdefGHI')
# => {:lowercase=>66.66666666666666, :uppercase=>33.33333333333333, :neither=>0}
# goal output:
# => {:lowercase=>66.67, :uppercase=>33.33, :neither=>0.0}

def percentify_round(num, denom)
  (num.to_f / denom.to_f * 100).round(2)
end

def letter_pcts(str)
  size = str.length.to_f
  hsh = push_counts_to_hsh(str, create_pct_hsh)
  hsh[:lowercase] = percentify_round(hsh[:lowercase], size)
  hsh[:uppercase] = percentify_round(hsh[:uppercase], size)
  hsh[:neither] = percentify_round(hsh[:neither], size)
  hsh
end

# check work:
p letter_pcts('abcdefGHI') == {:lowercase=>66.67, :uppercase=>33.33, :neither=>0.0}
# => true