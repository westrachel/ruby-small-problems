# Problem:
# Edit staggered_case method so that non-alphabetical
#   characters don't count when you switch between cases

# Examples:
# staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
# staggered_case('ALL CAPS') == 'AlL cApS'
# staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'

# Data:
# Input:
#   > String w/ words delimited by spaces and 'words' can contain
#      other characters
# Output:
#   > New string with alternate letters upper and lowercased

# Algorithm:
# i. Establish a letter counter variable = 0, a character index variable = 0, and an empty string variable
# ii. Loop through the passed in string and in each iteration of the loop:
#       > assess if the character at the character index is alphabetical and the letter counter variable is even
#           >> if yes to both, then push a capitalized version of this letter to the new string & add 1 to the letter counter
#       > if the character at the character index is alphabetical, but the letter counter variable is odd, then
#           >> push a downcased version of this letter to the new string & add 1 to the letter counter
#       > if the character is not alphabetical at the character index of the passed in string, then push it w/out any changes to
#          it to the new string variable
#       > at the end of each iteration add 1 to the char_index variable
#       > break out of the loop once the new string's size is equivalent to the passed in string's siz
# iii. return the new_string (have it be the last expression evaluated in the defined method)
#
# Code:
def staggered_case_ignore_non_letters(str)
  letter_counter = 0
  char_index = 0
  new_str = ''
  loop do
    if str[char_index] =~ /[A-Za-z]/ && letter_counter.even?
      new_str << str[char_index].capitalize
      letter_counter += 1
    elsif str[char_index] =~ /[A-Za-z]/ && letter_counter.odd?
      new_str << str[char_index].downcase
      letter_counter += 1
    else
      new_str << str[char_index]
    end
    char_index += 1
    break if new_str.size == str.size
  end
  new_str
end
    

# Check work:
p staggered_case_ignore_non_letters('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
# => true
p staggered_case_ignore_non_letters('ALL CAPS') == 'AlL cApS'
# => true
p staggered_case_ignore_non_letters('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'
# => true

def staggered_case_consider_non_letters(str)
  char_index = 0
  new_str = ''
  loop do
    if str[char_index] =~ /[A-Za-z]/ && char_index.even?
      new_str << str[char_index].capitalize
    elsif str[char_index] =~ /[A-Za-z]/ && char_index.odd?
      new_str << str[char_index].downcase
    else
      new_str << str[char_index]
    end
    char_index += 1
    break if new_str.size == str.size
  end
  new_str
end

# Check work:
p staggered_case_consider_non_letters('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
# => true
p staggered_case_consider_non_letters('ALL CAPS') == 'AlL CaPs'
# => true
p staggered_case_consider_non_letters('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'
# => true

# Further Exploration:
# create a more flexible method that has an additonal parameter that specifies
#  whether non-letters should be counted when figuring out how to stagger the case
#  of the alphabetical letters
def staggered_case_final(str, assess_non_letters)
  if assess_non_letters # if true
    staggered_case_consider_non_letters(str)
  else
    staggered_case_ignore_non_letters(str)
  end
end


# Check work:
p staggered_case_final('I Love Launch School!', false) == 'I lOvE lAuNcH sChOoL!'
# => true
p staggered_case_final('ALL CAPS', false) == 'AlL cApS'
# => true
p staggered_case_final('ignore 77 the 444 numbers', false) == 'IgNoRe 77 ThE 444 nUmBeRs'
# => true
p staggered_case_final('I Love Launch School!', true) == 'I LoVe lAuNcH ScHoOl!'
# => true
p staggered_case_final('ALL CAPS', true) == 'AlL CaPs'
# => true
p staggered_case_final('ignore 77 the 444 numbers', true) == 'IgNoRe 77 ThE 444 NuMbErS'
# => true

# Alternative Solution to Further Exploration:
def regex_condition(boolean)
  case boolean
  when false
    /[a-z]/i
  when true
    /./
  end
end

def case_staggered(str, assess_non_letters)
  new_str = ''
  need_upper = true
  x = regex_condition(assess_non_letters)
  str.chars.each do |char|
    if char =~ x
      if need_upper
        new_str += char.upcase
      else
        new_str += char.downcase
      end
      need_upper = !need_upper
    else
      new_str += char
    end
  end
  new_str
end

# Check work:
p case_staggered('I Love Launch School!', false) == 'I lOvE lAuNcH sChOoL!'
# => true
p case_staggered('ALL CAPS', false) == 'AlL cApS'
# => true
p case_staggered('ignore 77 the 444 numbers', false) == 'IgNoRe 77 ThE 444 nUmBeRs'
# => true
p case_staggered('I Love Launch School!', true) == 'I LoVe lAuNcH ScHoOl!'
# => true
p case_staggered('ALL CAPS', true) == 'AlL CaPs'
# => true
p case_staggered('ignore 77 the 444 numbers', true) == 'IgNoRe 77 ThE 444 NuMbErS'
# => true
