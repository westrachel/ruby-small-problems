def after_midnight(str)
  int_time = str[0,2].to_i * 60 + str[3, 2].to_i
  int_time == 1440 ? int_time = 0 : int_time
end

def before_midnight(str)
  int_time = str[0,2].to_i * 60 - str[3, 2].to_i
  int_time == 1440 ? int_time = 0 : int_time
end



# check work: all should print as true (they do!)
puts after_midnight('00:00') == 0
puts before_midnight('00:00') == 0
puts after_midnight('12:34') == 754
puts before_midnight('12:34') == 686
puts after_midnight('24:00')  == 0
puts before_midnight('24:00') == 0