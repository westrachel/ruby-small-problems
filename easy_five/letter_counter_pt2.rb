# Problem:
# Edit previously created word_sizes method to exclude non-letters
# while calculating word size

# Algorithm:
# Adjustment needed to previous algorithm: 
#   Add in regex while calling gsub to remove non-letters
#    and replace them w/ no-spaces (essentialy just deleting
#    the non-letters)
#
# Implication of adjustmnet:
#   Call split method first to create an array of different string "words"
#    ("words" = delimited by spaces) and then call gsub on each "word" w/in
#    the array to remove the non-letters from the "words"
#
# Underlying assumption: 
# Even if a word w/ #s is inputted, those words will be
#  scrubbed and the numbers w/in the word won't be counted

def word_sizes(str)
  arr_of_word_sizes = str.split.map do |word|
    word.gsub(/[^a-zA-Z]/, '').size
  end
  arr_uniq_word_sizes = arr_of_word_sizes.uniq
  hash = {}
  arr_uniq_word_sizes.each do |uniq_word_size|
    hash[uniq_word_size] = arr_of_word_sizes.count(uniq_word_size)
  end
  hash
end

# check work
puts word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
puts word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
puts word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
puts word_sizes('') == {}
puts word_sizes('hey93434') == { 3 => 1 }

# Refactored version using Hash::new
def word_sizes(str)
  hash = Hash.new(0)
  str.split.map do |word|
    hash[word.gsub(/[^a-zA-Z]/, '').size] += 1
  end
  hash
end

# check work
puts word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
puts word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
puts word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
puts word_sizes('') == {}
puts word_sizes('hey93434') == { 3 => 1 }
