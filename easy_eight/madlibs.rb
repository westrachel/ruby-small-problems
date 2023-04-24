# Problem:
# Create a mad-lib program w/ the following requirements:
#  a. prompt for a noun, verb, adjective
#  b. take the user's inputs from a and embed them into your story

# Example:
# Enter a noun: dog
# Enter a verb: walk
# Enter an adjective: blue
# Enter an adverb: quickly

# Do you walk your blue dog quickly? That's hilarious!

# Program:
def input_msg(input_type)
  if input_type == "noun" || input_type == "verb"
    second_word = "a"
  else
    second_word = "an"
  end
  puts "Enter #{second_word} #{input_type}:"
end

# validate words to make user have to prohibit some unwanted situations:
#   i. user enters nothing (ie noun = '')
#   ii. user enters a bunch of spaces
#   iii. user enters more than one word for a category instead of just one word
#        > assuming during the validate process that the 2 words will be
#            separated by spaces
#        > technically, user could get around this by inputting 2 words together
#           w/ no space between them, but I'm okay with that for this madlibs program
#           that creates a likely to be silly/nonsensical story output anyways

def valid_input?(str)
  if str.empty?
    false
  elsif str.strip.empty?
    false
  elsif str.split.size > 1
    false
  else
    true
  end
end

stories_created = 0

loop do
  if stories_created == 0
    puts "Welcome to Madlibs! Let's create a story."
  else
    puts "Let's create another Madlibs!"
  end

  input_msg("noun")
  noun = gets.chomp

  until valid_input?(noun)
    puts "Invalid input."
    input_msg("noun")
    noun = gets.chomp
  end

  input_msg("verb")
  verb = gets.chomp

  until valid_input?(verb)
    puts "Invalid input."
    input_msg("verb")
    verb = gets.chomp
  end

  input_msg("adjective")
  adjective = gets.chomp

  until valid_input?(adjective)
    puts "Invalid input."
    input_msg("adjective")
    adjective = gets.chomp
  end

  input_msg("adverb")
  adverb = gets.chomp

  until valid_input?(adverb)
    puts "Invalid input."
    input_msg("adverb")
    adverb = gets.chomp
  end

  puts "The #{adjective} #{noun} was joined by a flock of seagulls to #{adverb} #{verb} around Central Park."

  puts "Do you want to create another story? If so, enter Y or y."
  new_story = gets.chomp
  break if new_story.downcase != "y"
  stories_created += 1

end
