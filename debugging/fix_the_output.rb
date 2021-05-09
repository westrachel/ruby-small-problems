arr = ["9", "8", "7", "10", "11"]
p arr.sort do |x, y|
    y.to_i <=> x.to_i
  end

# Expected output: ["11", "10", "9", "8", "7"] 
# Actual output: ["10", "11", "7", "8", "9"] 

# Fix the above code w/o removing anything to return the expected
arr = ["9", "8", "7", "10", "11"]
sorted = arr.sort do |x, y|
          y.to_i <=> x.to_i
        end
p sorted == ["11", "10", "9", "8", "7"]
# => true
