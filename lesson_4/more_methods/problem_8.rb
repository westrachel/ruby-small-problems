# According to Array#take Ruby documentation, take will return a new array that contains
#   the first <n> number of elements in the array it's called on, where <n> is specified 
#    as a required argument to pass into take when call the take method.
# Based on the description & example of take in the Ruby documentation, it's unclear
#   whether this method is mutating. Since it's not specified that take mutates the 
#   Array it's called on, it probably doesn't mutate it. However, I can confirm that
#   take is not destructive by testing out tate in irb:
#   irb :001 > a = [1, 36, 5, 9]
#   irb :002 > a.take(2)
#   => [1, 36]
#   irb :003 > a
#   => [1, 36, 5, 9]   <=> this test in irb confirms that take is not destructive
