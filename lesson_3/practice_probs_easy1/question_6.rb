# write two ways to put "Four score and " in front of famous_words

# 1st way:
famous_words = "seven years ago..."
famous_words = "Four score and " + famous_words
puts famous_words

# 2nd way:
famous_words = "seven years ago..."
more_famous_words = "Four score and "
famous_words = more_famous_words.concat(famous_words)
puts famous_words

# alternatives: use #prepend or uss #<<