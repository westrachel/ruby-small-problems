def neutralize(sentence)
  words = sentence.split(' ')
  words.each do |word|
   words.delete(word) if negative?(word)
  end

  words.join(' ')
end

def negative?(word)
  [ 'dull',
    'boring',
    'annoying',
    'chaotic'
  ].include?(word)
end

puts neutralize('These dull boring cards are part of a chaotic board game.')
# Expected: These cards are part of a board game.
# Actual: These boring cards are part of a board game.

# Why does Expected != Actual:
# Since dull and boring are right next to each other in the words array, when dull is deleted,
#   boring becomes the word at the index that dull was previously located at. So, when dull is
#   deleted, the word boring is skipped over and does not get deleted.

# Update to method to make it work:
def neutralize(sentence)
  words = sentence.split(' ')
  words.select do |word|
    negative?(word) == false
  end.join(' ')
end

def negative?(word)
  [ 'dull',
    'boring',
    'annoying',
    'chaotic'
  ].include?(word)
end

puts neutralize('These dull boring cards are part of a chaotic board game.')
# => These cards are part of a board game.
