# Problem:
# Create a method that takes a String and returns a new string w/ the case of
# each character flip flops for English alphabetical words
#  > specifically, the character at the 0th index of each passed in string
#     should be uppercased
#  > non-letters are unchanged but count as characters when switching between upper
#     and lowercase even though they don't have a case


def staggered_case_even_cap(str)
  new_str = ''
  idx = 0
  loop do
    if idx.even?
      str[idx].match(/[A-Za-z]/) ? new_str << (str[idx].upcase) : new_str << (str[idx])
    elsif idx.odd?
      str[idx].match(/[A-Za-z]/) ? new_str << (str[idx].downcase) : new_str << (str[idx])
    end
    idx += 1
    break if idx == str.size
  end
  new_str
end
  
# Check work:
p staggered_case_even_cap('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
# => true
p staggered_case_even_cap('ALL_CAPS') == 'AlL_CaPs'
# => true
p staggered_case_even_cap('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'
# => true

# Further Exploration:
# make the string more flexible so that it can be specified in the method call
#  if letters at even (odd) indices should be uppercased and letters at
#   odd (even) indices should be lowercased

def staggered_case_odd_cap(str)
  new_str = ''
  idx = 0
  loop do
    if idx.even?
      str[idx].match(/[A-Za-z]/) ? new_str << (str[idx].downcase) : new_str << (str[idx])
    elsif idx.odd?
      str[idx].match(/[A-Za-z]/) ? new_str << (str[idx].upcase) : new_str << (str[idx])
    end
    idx += 1
    break if idx == str.size
  end
  new_str
end

def staggered_case(str, even_or_odd)
  case even_or_odd
  when 'even'
    staggered_case_even_cap(str)
  when 'odd'
    staggered_case_odd_cap(str)
  end
end

# Check work:
p staggered_case('I Love Launch School!', 'even') == 'I LoVe lAuNcH ScHoOl!'
# => true
p staggered_case('ALL_CAPS', 'even') == 'AlL_CaPs'
# => true
p staggered_case('ignore 77 the 444 numbers', 'even') == 'IgNoRe 77 ThE 444 NuMbErS'
# => true

p staggered_case('I Love Launch School!', 'odd') == 'i lOvE LaUnCh sChOoL!'
# => true
p staggered_case('ALL_CAPS', 'odd') == 'aLl_cApS'
# => true
p staggered_case('ignore 77 the 444 numbers', 'odd') == 'iGnOrE 77 tHe 444 nUmBeRs'
# => true
