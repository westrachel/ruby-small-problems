advice = "Few things in life are as important as house training your pet dinosaur."

p advice.slice!("Few things in life are as important as ") # return value is the portion deleted and that's what's printed
p advice # slice! mutates the caller


advice = "Few things in life are as important as house training your pet dinosaur."

p advice.slice("Few things in life are as important as ") 
p advice # slice does not mutate the caller
