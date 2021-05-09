# update the code to reverse the sentence properly w/o using any
#  built-in reverse methods

#def reverse_sentence(sentence)
#  words = sentence.split(' ')
#  reversed_words = []

#  i = 0
#  while i < words.length
#    reversed_words = words[i] + reversed_words
#    i += 1
#  end

#  reversed_words.join(' ')
#end

#p reverse_sentence('how are you doing')
# expected output: 'doing you are how'
# actual output: nothing; erorr raised due to trying to conver an array into a string

def reverse_sentence(sentence)
  words = sentence.split(' ')
  reversed_words = []

  i = words.length - 1
  while i > -1
    reversed_words << words[i]
    i -= 1
  end

  reversed_words.join(' ')
end

p reverse_sentence('how are you doing') == 'doing you are how'
# => true
