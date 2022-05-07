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

  def clear_canvas
    binding.pry
    @structure
  end

  def colour_pixel(row, column, colour)
    binding.pry
    @structure[row][column-1] = colour
  end
  def integer_size_check(array)
    array.each{ |number| number >= 0 && number <= 250 ? check = true : check = false }
    return check
    binding.pry
  end

  def vertical_segment(column, row_1, row_2, colour)
    sorted_rows = [row_1, row_2].sort
    # this line takes 2 numbers(rows) and generates an array of all numbers between and inclusive of the 2 numbers(rows)
    all_rows = (row_1..row_2).grep row_1..row_2
    all_rows.each_with_index do |index, row|
      @structure[index][column-1] = colour
    end
  end

  def horizontal_segment(column_1, column_2, row, colour)
    sorted_rows = [column_1, column_2].sort
    # this line takes 2 numbers(columns) and generates an array of all numbers between and inclusive of the 2 numbers(columns)
    all_columns = (column_1..column_2).grep column_1..column_2

    @structure[row].each_with_index do |e, index|
      # if index is a match with a number from all_columns, change that element
      if all_columns.include?(index+1)
        @structure[row][index] = colour
      end
    end
  end

  def scale(percent)
    row_num = @structure.keys[-1]
    col_num = @structure[1].count
    rows_to_add = row_num * (percent/100)
    cols_to_add = @structure[1].count * (percent/100)
    
    # This adds the new rows & columns
    rows_to_add.times do |index|
      row_key = index + row_num + 1
      @structure[row_key] = Array.new(cols_to_add, "O")
    end

    # This adds to the rows that already exist
    (row_num + rows_to_add).times do |index|
      binding.pry
      @structure[index + 1] << Array.new(cols_to_add, "O")
      @structure[index + 1].flatten!
    end
  end

end


