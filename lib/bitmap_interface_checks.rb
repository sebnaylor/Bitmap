def integer_size_check(array)
  valid_number = true
  array.each do |number| 
    if !(number >= 0 && number <= 250) 
      valid_number == false
    end
  end
end