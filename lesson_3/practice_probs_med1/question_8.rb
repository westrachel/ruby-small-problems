# puts rps(rps(rps("rock", "paper"), rps("rock", "scissors")), "rock")

# rps("rock", "scissors") <=> should return: "rock" (*)
# rps("rock", "paper") <=> should return: "paper" (**)
# rps("(*), (**)") <=> should return: "paper"
# most outer call is: rps("paper", "rock") <=> should return: "paper"

# final answer: line one should print "paper"