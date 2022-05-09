def integer_size_check(array)
  array.all? { |number| number >= 0 && number <= 250 }
end

def input_to_i(input)
  input.split(' ').map { |string| string.to_i }
end

def integer_size_msg
  'This application is not optimised for numbers less than 0 or more than 250. Please enter more appropriate numbers'
end