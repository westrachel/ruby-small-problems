# Problem:
# Create a method that takes one argument input (a string), and outputs/returns a
# *new* string in which every character is doubled

def repeater(str)
  blank_str = ""
  str.chars.each do |letter|
    2.times { blank_str << letter }
  end
  blank_str
end

# check work:
p repeater('Hello') == "HHeelllloo"
# => true
p repeater("Good job!") == "GGoooodd  jjoobb!!"
# => true
p repeater('') == ''
# => true
