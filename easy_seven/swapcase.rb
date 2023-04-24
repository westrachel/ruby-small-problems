# Problem
# Create a method that takes a string and replaces each lowercased English
#  alphabetical letters with that letter uppercased and vice versa and
#  returns a new string w/ each letter's case swapped
#     > Leave non English alphabetical letters as is
#     > Words are delimited by spaces in the inputted string
#     > do not use String#swapcase

UPPERCASED_ABCS = ('A'..'Z').to_a
LOWERCASED_ABCS = ('a'..'z').to_a
ABCS_HASH = { }

# Push each lowercase letter and its corresponding uppercase version
#   to the ABCS_HASH constant as a key-value pair

index = 0
loop do
  ABCS_HASH[LOWERCASED_ABCS[index]] = UPPERCASED_ABCS[index]
  index += 1
  break if index == 26
end


def swapcase(str)
  str.chars.map do |word|
    word.chars.map do |char|
      if ABCS_HASH.has_key?(char)
        char.upcase
      elsif ABCS_HASH.has_value?(char)
        char.downcase
      else
        char # return character as is if not a letter
      end
    end.join('')
  end.join('')
end

# Check work:
puts swapcase('CamelCase') == 'cAMELcASE'
# => true
puts swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'
# => true
