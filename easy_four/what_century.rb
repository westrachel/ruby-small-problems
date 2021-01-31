def century(num)
  if num.to_s.length < 3
    "1st"
  else
    cent_base = num.to_f / 100.0
    cent_base - cent_base.round > 0.0 ? cent = cent_base.round + 1 : cent = cent_base.round
    last_digit = cent.to_s[cent.to_s.length - 1] #select last digit of base
    second_to_last_digit = cent.to_s[cent.to_s.length - 2]
    if (last_digit == "1" && cent.to_s.length == 1) || (last_digit == "1" && second_to_last_digit != "1") 
      "#{cent}st"
    elsif last_digit == "2" && second_to_last_digit == "0"
      "#{cent}nd"
    elsif (last_digit == "3" && second_to_last_digit == "0") || (last_digit == "3" && cent.to_s.length == 1)
      "#{cent}rd"
    else
      "#{cent}th"
    end
  end
end

#check work:
puts century(2000) # should return '20th'
puts century(2001) # should return '21st'
puts century(1965) # should return '20th'
puts century(256) #  should return '3rd'
puts century(5) #  should return '1st'
puts century(10103) #  should return '102nd'
puts century(1052) #  should return '11th'
puts century(1127) #  should return '12th'
puts century(11201) #  should return '113th'
    