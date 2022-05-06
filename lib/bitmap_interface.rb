require_relative 'bitmap'
require_relative 'bitmap_interface_checks'
require 'pry'

running = true

puts '-----------------------------'
puts 'Welcome to Bitmap Editor 2022'
puts '-----------------------------'

until running == false
  canvas = nil
  puts 'Enter a command'
  input = gets.chomp

  if input[0] == 'I' && input.match?(/\A[a-zA-z]\s\d{1,3}\s\d{1,3}\z$/)
    puts 'Succesful trigger of the I command'
    input_array = input.split(' ').map{ |string| string.to_i}
    @canvas = Canvas.new
    @canvas.create_canvas(input_array[1], input_array[2])
  
  elsif input[0] == 'C'
    puts 'Succesful trigger of the C command'

  elsif input[0] == 'L' && input.match?(/\A[a-zA-z]\s\d{1,3}\s\d{1,3}\s[a-zA-z]$/)
    puts 'Succesful trigger of the L command'

  elsif input[0] == 'V' && input.match?(/\A[a-zA-z]\s\d{1,3}\s\d{1,3}\s\d{1,3}\s[a-zA-z]\z$/)
    puts 'Succesful trigger of the V command'

  elsif input[0] == 'H' && input.match?(/\A[a-zA-z]\s\d{1,3}\s\d{1,3}\s\d{1,3}\s[a-zA-z]\z$/)
    puts 'Succesful trigger of the H command'

  elsif input[0] == 'F' && input.match?(/\A[a-zA-z]\s\d{1,3}\s\d{1,3}\s[a-zA-z]$/)
    puts 'Succesful trigger of the F command'

  elsif input[0] == 'W' && input.match?(/\A[a-zA-Z]\s\d{1,3}$/)
    puts 'Succesful trigger of the W command'

  elsif input == 'S'
    @canvas.show_canvas

  elsif input == 'X'
    puts 'Succesful trigger of the I command'
    running = false

  elsif input == '?'
    puts 'Instructions TBC'
    
  else
    puts "I didn't recognise that input. Type '?' for information on what I can understand"
  end
end

puts '----------------------------'
puts 'Thanks for using Bitmap 2022!'
puts '----------------------------'
