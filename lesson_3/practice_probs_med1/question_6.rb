answer = 42

def mess_with_it(some_number)
  some_number += 8
end

new_answer = mess_with_it(answer)

p answer - 8 # should return 34
# answer is not mutated by the definition when it's passed in
# so, answer - 8 = 42 - 8 = 34 in line 9 