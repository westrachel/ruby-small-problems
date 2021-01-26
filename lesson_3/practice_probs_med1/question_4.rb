def rolling_buffer1(buffer, max_buffer_size, new_element)
  buffer << new_element
  buffer.shift if buffer.size > max_buffer_size
  buffer
end

def rolling_buffer2(input_array, max_buffer_size, new_element)
  buffer = input_array + [new_element]
  buffer.shift if buffer.size > max_buffer_size
  buffer
end

# rolling_buffer1 will mutate the specified buffer argument that's passed into it
# rolling_buffer2 will not mutate the input_array argument that's passed into it
# this is b/c rolling_buffer2 creates a variable, buffer, that references the value of the 
# new_element argument added to input_array
