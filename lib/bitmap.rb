require 'pry'
# Plan:

# Initialise a running variable that will hold the session
# Add some basic commands asking user for an input

# CREATE CANVAS CLASS.
# 1. x variable length & y variable length between 1 and 250
# 2. Method to take 2 variables(x,y) then create a hash with row number as key and the colour values 
# as an array (using y as the length of the array)

# CLI COMMANDS :
# 1. [I X Y] - creates a new canvas of colour O of size X, Y
# 2. [C] - clears the canvas, setting all pixels to white
# 3. [S] - shows contents of current canvas
# 4. [X] - terminates the session
# 5. [?] - shows help tips
# 6. [V column_x, row_1, row_2, colour] - draws a vertical line of colour colour
# 7. [H column_1, column_2, row_y, colour] - draws a horizontal line of colour colour
# 8. [F, pixel_x, pixel, colour] - fills a region with a colour 
    # 8.1 - any pixel the same colour as pixel[X, Y] && shares a common side with any pixel 
    # 8.2 - use recursion!

  
class Canvas 
  attr_accessor :structure

  def initialize
    @structure = {}
  end

  def create_canvas(rows, columns)
    array = Array.new
    rows.times do |index|
      @structure[index + 1] = Array.new(columns, "O")
    end    
  end

  def show_canvas
    @structure.each do |row|
      puts row[1].join
    end
  end

  def integer_size_check(array)
    array.each{ |number| number >= 0 && number <= 250 ? check = true : check = false }
    return check
    binding.pry
  end
end


# TESTING CODE
# canvas = Canvas.new
# canvas.create_canvas(10,10)
# puts canvas.structure
# canvas.show_canvas

