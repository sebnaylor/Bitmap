require_relative 'bitmap'
require_relative 'bitmap_interface_checks'

running = true

puts '-----------------------------'
puts 'Welcome to Bitmap Editor 2022'
puts '-----------------------------'
puts '                             '
puts "Enter '?' to find out how to use me"

until running == false
  puts '>'
  input = gets.chomp

  if input[0] == 'I' && input.match?(/\A[a-zA-z]\s\d{1,3}\s\d{1,3}\z$/)
    input_to_numbers = input_to_i(input)
    puts integer_size_msg if integer_size_check(input_to_numbers) == false
    @canvas = Canvas.new
    @canvas.create_canvas(input_to_numbers[1], input_to_numbers[2])
  elsif input[0] == 'C'
    @canvas.clear_canvas

  elsif input[0] == 'L' && input.match?(/\A[a-zA-z]\s\d{1,3}\s\d{1,3}\s[a-zA-z]$/)
    input_to_numbers = input_to_i(input)
    @canvas.colour_pixel(input_to_numbers[1], input_to_numbers[2], input[-1])

  elsif input[0] == 'V' && input.match?(/\A[a-zA-z]\s\d{1,3}\s\d{1,3}\s\d{1,3}\s[a-zA-z]\z$/)
    input_to_numbers = input_to_i(input)
    @canvas.vertical_segment(input_to_numbers[1], input_to_numbers[2], input_to_numbers[3], input[-1])

  elsif input[0] == 'H' && input.match?(/\A[a-zA-z]\s\d{1,3}\s\d{1,3}\s\d{1,3}\s[a-zA-z]\z$/)
    input_to_numbers = input_to_i(input)
    @canvas.horizontal_segment(input_to_numbers[1], input_to_numbers[2], input_to_numbers[3], input[-1])

  elsif input[0] == 'F' && input.match?(/\A[a-zA-z]\s\d{1,3}\s\d{1,3}\s[a-zA-z]$/)
    input_to_numbers = input_to_i(input)
    # @canvas.fill_region(input_to_numbers[1], input_to_numbers[2], input[-1])

  elsif input[0] == 'W' && input.match?(/\A[a-zA-Z]\s-?\d{1,3}$/)
    input_to_numbers = input_to_i(input)
    @canvas.scale(input_to_numbers[1])

  elsif input == 'S'
    @canvas.show_canvas

  elsif input == 'X'
    running = false

  elsif input == '?'
    
    puts "List of commands:
    'I M N' Creates a new M x N canvas with all pixels coloured white (O).
    'C' Clears the canvas, setting all pixels to white (O).
    'L X Y C' Colours the pixel (X,Y) with colour C.
    'V X Y1 Y2 C' Draws a vertical segment of colour C in column X between rows Y1 and Y2 (inclusive).
    'H X1 X2 Y C' Draws a horizontal segment of colour C in row Y between columns X1 and X2 (inclusive).
    'F X Y C'  Fills the region R with the colour  - PLEASE NOTE THIS FUNCTIONALITY IS NOT OPERATIONAL
    'W F' Scales the canvas with the given factor F (in percentage) - PLEASE NOTE THIS FUNCTIONALITY HAS UNSTABLE RESULTS IF SCALING ON A BITMAP WITH UNEVEN AMOUNT OF ROWS/COLUMNS!
    'S' Show the contents of the current canvas
    'X' Terminates the session
    '?' Shows in program help"
    puts "Example usage:
    'I 6 8' Creates a bitmap with 6 rows and 8 columns
    'S' shows the current state of the bitmap
    'C' clears the bitmap and sets all pixels to 'O'
    'L 4 6 P' colours the pixel 4 rows down and 6 columns across with colour 'P'
    'V 7 2 5 I' colours all pixels in the 7th column that are between rows 2 and 5 with colour 'I'
    'H 2 7 5 I' colours all pixels in the 5th row that are between columns 2 and 7
    'F 3 4 I' fills a region with the colour 'I'
    'W 200' scales the bitmap by a factor of 200%"

  else
    puts "I didn't recognise that input. Type '?' for information on what I can understand"
  end
end

puts '----------------------------'
puts 'Thanks for using Bitmap 2022!'
puts '----------------------------'
