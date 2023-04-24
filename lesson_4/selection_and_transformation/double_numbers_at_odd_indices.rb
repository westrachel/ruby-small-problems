# problem: define method that doubles numbers of an array that have odd indices

def double_numbers(num_arr)
  doubled_nums = []
  counter = 0
  
  loop do
    break if counter == num_arr.size
    counter.odd? ? doubled_nums << 2 * num_arr[counter] : doubled_nums << num_arr[counter]
    counter += 1
  end
  
  doubled_nums
end

my_numbers = [1, 4, 3, 7, 2, 6]
p double_numbers(my_numbers) # => [1, 8, 3, 14, 2, 12]
