def cleanup(str)
  str.gsub!(/[^a-zA-Z0-9 :]/, ' ').gsub(/\s+/, ' ')
  # second gsub is to reduce multiple spaces in a row to one space
end

# check work:
puts cleanup("---what's my +*& line?") == ' what s my line '