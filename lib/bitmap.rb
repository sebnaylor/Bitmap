# require 'pry'

class Canvas
  attr_accessor :structure

  def create_canvas(rows, columns)
    @structure = {}
    rows.times do |index|
      @structure[index + 1] = Array.new(columns, 'O')
    end
  end

  def show_canvas
    @structure.each do |row|
      puts row[1].join
    end
  end

  def clear_canvas
    row_num = @structure.keys[-1]
    col_num = @structure[1].count
    create_canvas(row_num, col_num)
  end

  def colour_pixel(row, column, colour)
    @structure[row][column - 1] = colour
  end

  def vertical_segment(column, row1, row2, colour)
    sorted_rows = [row1, row2].sort
    # this line takes 2 numbers(rows) and generates an array of all numbers between and inclusive of the 2 numbers(rows)
    sorted_rows = (row1..row2).grep row1..row2
    sorted_rows.each_with_index do |index, _|
      @structure[index][column - 1] = colour
    end
  end

  def horizontal_segment(column1, column2, row, colour)
    sorted_cols = [column1, column2].sort
    # this line takes 2 numbers(columns) and generates an array of all numbers between the 2 numbers(columns)
    sorted_cols = (column1..column2).grep column1..column2

    @structure[row].each_with_index do |_, index|
      # if index is a match with a number from all_columns, change that element
      @structure[row][index] = colour if sorted_cols.include?(index + 1)
    end
  end

  def scale(percent)
    row_num = @structure.keys[-1]
    col_num = @structure[1].count
    desired_rows = (row_num * percent / 100)
    desired_cols = (col_num * percent / 100)
    rows_to_change = (desired_rows - row_num).abs
    cols_to_change = (desired_cols - col_num).abs

    if percent >= 100
      # This adds the new rows & columns
      (desired_rows - row_num).times do |index|
        row_key = index + row_num + 1
        @structure[row_key] = Array.new(desired_cols, 'O')
      end
      # This adds to the rows that already exist
      (desired_rows - row_num).times do |index|
        @structure[index + 1] << Array.new(cols_to_change, 'O')
        @structure[index + 1].flatten!
      end

    elsif percent < 100
      rows_to_change.times do |index|
        @structure[index + 1].pop(cols_to_change)
      end

      rows_to_change.times do |_|
        @structure.delete(@structure.keys.last)
      end
    end
  end

  def fill_region(row, column, colour)
    # find pixel
    # colour it with colour
    # find the pixels north, east, south and west. Hash of 2-4 border pixels
    # iterate through the 2-4 pixels
    #   if the pixel is outside the bounds of the canvas, or it's the same colour as the original pixel, break out of
    #     the fill_region
    #   if theyre not the same colour as the original pixel, colour them the same as pixel
    #   call fill_region on the pixel

    pixel = @structure[x][y]
    colour_pixel(x, y, colour)

    border_pixels = {}

    unless @structure[x - 1].nil? || y.negative? || (y) > @structure[1].count
      north_pixel = @structure[x - 1][y]
      border_pixels['north_pixel'] = [(x - 1), y, north_pixel]
    end
    unless @structure[x].nil? || (y + 1).negative? || (y + 1) > @structure[1].count
      east_pixel = @structure[x][y + 1]
      border_pixels['east_pixel'] = [x, (y + 1), east_pixel]
    end
    unless @structure[x + 1].nil? || y.negative? || y > @structure[1].count
      south_pixel = @structure[x + 1][y]
      border_pixels['south_pixel'] = [(x + 1), y, south_pixel]
    end
    unless @structure[x].nil? || (y - 1).negative? || (y - 1) > @structure[1].count
      west_pixel = @structure[x][y - 1]
      border_pixels['west_pixel'] = [x, (y - 1), west_pixel]
    end

    border_pixels.each do |border_pixel|
      next if border_pixel.nil? || border_pixel[1][2] == pixel

      fill_region(border_pixel[1][0], border_pixel[1][1], colour)
    end
  end
end
