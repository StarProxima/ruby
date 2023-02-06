def find_minimum(array)
    throw "Empty array" if array.empty?
    min = array[0]
    for i in 1...array.length
      min = array[i] if array[i] < min end
    min
end

def find_number_of_first_positive_element(array)
    throw "Empty array" if array.empty?
    i = 0
    while i < array.length
      if array[i] > 0
        return i
      end
      i += 1
    end
    throw "No positive elements"
end

puts "find_minimum: #{find_minimum(ARGV.map(&:to_i))}"
puts "find_number_of_first_positive_element: #{find_number_of_first_positive_element(ARGV.map(&:to_i))}"