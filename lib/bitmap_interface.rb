require_relative 'bitmap'
require_relative 'bitmap_interface_checks'
require 'pry'

running = true

puts '-----------------------------'
puts 'Welcome to Bitmap Editor 2022'
puts '-----------------------------'

until running == false
  puts '>'
  input = gets.chomp

  if input[0] == 'I' && input.match?(/\A[a-zA-z]\s\d{1,3}\s\d{1,3}\z$/)
    input_to_numbers = input.split(' ').map{ |string| string.to_i}
    @canvas = Canvas.new
    @canvas.create_canvas(input_to_numbers[1], input_to_numbers[2])
  elsif input[0] == 'C'
    # Clears the canvas, setting all pixels to white (O).
    puts 'Succesful trigger of the C command'
    @canvas.clear_canvas

  elsif input[0] == 'L' && input.match?(/\A[a-zA-z]\s\d{1,3}\s\d{1,3}\s[a-zA-z]$/)
    # Colours the pixel (X,Y) with colour C.
    input_to_numbers = input.split(' ').map{ |string| string.to_i}
    puts 'Succesful trigger of the L command'
    @canvas.colour_pixel(input_to_numbers[1], input_to_numbers[2], input[-1])

  elsif input[0] == 'V' && input.match?(/\A[a-zA-z]\s\d{1,3}\s\d{1,3}\s\d{1,3}\s[a-zA-z]\z$/)
    # Draw a vertical segment of colour C in column X between rows Y1 and Y2 (inclusive).
    puts 'Succesful trigger of the V command'

  elsif input[0] == 'H' && input.match?(/\A[a-zA-z]\s\d{1,3}\s\d{1,3}\s\d{1,3}\s[a-zA-z]\z$/)
    # Draw a horizontal segment of colour C in row Y between columns X1 and X2 (inclusive).
    puts 'Succesful trigger of the H command'

  elsif input[0] == 'F' && input.match?(/\A[a-zA-z]\s\d{1,3}\s\d{1,3}\s[a-zA-z]$/)
    # Fill the region R with the colour C. R is defined as:
    puts 'Succesful trigger of the F command'

  elsif input[0] == 'W' && input.match?(/\A[a-zA-Z]\s\d{1,3}$/)
    # Scales the canvas with the given factor F (in percentage)
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
