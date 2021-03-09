# Problem
# Create the method that takes an inputted string and prints it in a box


# Examples:
#print_in_box('To boldly go where no one has gone before.')
#+--------------------------------------------+
#|                                            |
#| To boldly go where no one has gone before. |
#|                                            |
#+--------------------------------------------+

# print_in_box('')
#+--+
#|  |
#|  |
#|  |
#+--+

# Assumptions:
# inputted text will fit in the terminal window
#   > I'm interpreting this to mean that text will not span multiple lines.

def print_in_box(string_of_words)
  puts "+-" + "-" * string_of_words.size + "-+"
  puts "| " + " " * string_of_words.size + " |"
  puts "| " + "#{string_of_words}" + " |"
  puts "| " + " " * string_of_words.size + " |"
  puts "+-" + "-" * string_of_words.size + "-+"
end

# Check Work:
print_in_box('To boldly go where no one has gone before.')
print_in_box('')
print_in_box('Happy Monday!')

# Further Exploration Part 1:
# Edit method so that if message causes box (box = edges + inputted word) to be 80 units wide, 
# the message is cutoff.
#   > Max length inputted string can be is 76 
#      <=> max length = 80 = ( 4 units for outside edge & space around the string) + max inputted string length
#                   80 - 4 = max inputeted string length = 76
def box_this_string(str)
  if str.size > 76
    (str.size - 76).times { str.chop! }
  end
  puts "+-" + "-" * str.size + "-+"
  puts "| " + " " * str.size + " |"
  puts "| " + "#{str}" + " |"
  puts "| " + " " * str.size + " |"
  puts "+-" + "-" * str.size + "-+"
end

# Check Work:
box_this_string('To boldly go where no one has gone before, one must ignore perceived limitations & embrace uncomfortability.')

# Further Exploration Part 2:
# Word wrap long messages (messages > 76 in length), so that they print on multiple lines but are still w/in a box.

def boxify_this_string(str)
  if str.size < 77
    puts "+-" + "-" * str.size + "-+"
    puts "| " + " " * str.size + " |"
    puts "| " + "#{str}" + " |"
    puts "| " + " " * str.size + " |"
    puts "+-" + "-" * str.size + "-+"
  else
    puts "+-" + "-" * 76 + "-+"
    puts "| " + " " * 76 + " |" 
    until str.size == 0
      puts "| " + "#{str[0, 76]}" + " |" if str.size >= 76
      puts "| " + "#{str[0, 76]}" + " " * (76 - str.size) + " |" if str.size < 76
      str.slice!(0...76)
    end
    puts "| " + " " * 76 + " |"
    puts "+-" + "-" * 76 + "-+"
  end
end

# Check work:
boxify_this_string("An amazing thing happens when you get honest with youself and start dong what you love, what makes you happy. Your life literally slows down. You stop wishing for the weekend. You stop merely looking forward to special events.You begin to live each moment and you start feeling like a human being. You just ride the wave that is life. -Anonymous quote")

# returns =>
# +------------------------------------------------------------------------------+
# |                                                                              |
# | An amazing thing happens when you get honest with youself and start dong wha |
# | t you love, what makes you happy. Your life literally slows down. You stop w |
# | ishing for the weekend. You stop merely looking forward to special events.Yo |
# | u begin to live each moment and you start feeling like a human being. You ju |
# | st ride the wave that is life. -Anonymous quote                              |
# |                                                                              |
# +------------------------------------------------------------------------------+