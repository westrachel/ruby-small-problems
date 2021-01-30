def xor?(exp1, exp2)
 (exp1 == true && exp2 == false) || (exp1 == false && exp2 == true) ? true : false
end

#checks:
puts xor?(5.even?, 4.even?) == true
puts xor?(5.odd?, 4.odd?) == true
puts xor?(5.odd?, 4.even?) == false
puts xor?(5.even?, 4.odd?) == false