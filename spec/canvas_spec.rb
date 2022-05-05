require 'bitmap'

describe 'Canvas' do 
  it 'sets up a canvas with correct number of rows, columns and pixels' do
    canvas = Canvas.new
    canvas.create_canvas(3,3)
    expect canvas.structure == {
      1=>["O", "O", "O"],
      2=>["O", "O", "O"],
      3=>["O", "O", "O"]
    }
  end

end
