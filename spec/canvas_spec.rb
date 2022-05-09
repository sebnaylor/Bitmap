require 'bitmap'

describe Canvas do 
  it 'create_canvas sets up a canvas with correct number of rows, columns and pixels' do
    canvas = Canvas.new
    canvas.create_canvas(3, 3)
    expect(canvas.structure).to eq({
      1=>['O', 'O', 'O'],
      2=>['O', 'O', 'O'],
      3=>['O', 'O', 'O']
    })
  end

  it 'clear_canvas sets all pixels to the canvas' do
    canvas = Canvas.new
    canvas.create_canvas(4, 4)
    canvas.vertical_segment(1, 1, 4, 'C')
    canvas.clear_canvas
    expect(canvas.structure).to eq({
      1=>['O', 'O', 'O', 'O'],
      2=>['O', 'O', 'O', 'O'],
      3=>['O', 'O', 'O', 'O'],
      4=>['O', 'O', 'O', 'O']
    })
  end

  it 'colour_pixel adds a coloured pixel in the correct place' do
    canvas = Canvas.new
    canvas.create_canvas(2, 5)
    canvas.colour_pixel(2, 4, 'C')
    expect(canvas.structure).to eq({
      1=>['O', 'O', 'O', 'O', 'O'],
      2=>['O', 'O', 'O', 'C', 'O'],
    })
  end

  it 'vertical_segment adds the vertical segment with the correct colours in the correct place' do
    canvas = Canvas.new
    canvas.create_canvas(9, 8)
    canvas.vertical_segment(3, 2, 8, 'Z')
    expect(canvas.structure).to eq({
      1=>['O', 'O', 'O', 'O', 'O', 'O', 'O', 'O'],
      2=>['O', 'O', 'Z', 'O', 'O', 'O', 'O', 'O'],
      3=>['O', 'O', 'Z', 'O', 'O', 'O', 'O', 'O'],
      4=>['O', 'O', 'Z', 'O', 'O', 'O', 'O', 'O'],
      5=>['O', 'O', 'Z', 'O', 'O', 'O', 'O', 'O'],
      6=>['O', 'O', 'Z', 'O', 'O', 'O', 'O', 'O'],
      7=>['O', 'O', 'Z', 'O', 'O', 'O', 'O', 'O'],
      8=>['O', 'O', 'Z', 'O', 'O', 'O', 'O', 'O'],
      9=>['O', 'O', 'O', 'O', 'O', 'O', 'O', 'O'],
      })
  end

  it 'horizontal_segment adds the horizontal segment with the correct colours in the correct place' do
    canvas = Canvas.new
    canvas.create_canvas(4, 6)
    canvas.horizontal_segment(1, 5, 4, 'B')
    expect(canvas.structure).to eq({
      1=>['O', 'O', 'O', 'O', 'O', 'O'],
      2=>['O', 'O', 'O', 'O', 'O', 'O'],
      3=>['O', 'O', 'O', 'O', 'O', 'O'],
      4=>['B', 'B', 'B', 'B', 'B', 'O']
      })
  end

  it 'canvas_scale correctly scales at 200' do
    canvas = Canvas.new
    canvas.create_canvas(4, 8)
    canvas.scale(200)
    expect(canvas.structure).to eq({
      1=>['O', 'O', 'O', 'O', 'O', 'O', 'O', 'O', 'O', 'O', 'O', 'O', 'O', 'O', 'O', 'O'],
      2=>['O', 'O', 'O', 'O', 'O', 'O', 'O', 'O', 'O', 'O', 'O', 'O', 'O', 'O', 'O', 'O'],
      3=>['O', 'O', 'O', 'O', 'O', 'O', 'O', 'O', 'O', 'O', 'O', 'O', 'O', 'O', 'O', 'O'],
      4=>['O', 'O', 'O', 'O', 'O', 'O', 'O', 'O', 'O', 'O', 'O', 'O', 'O', 'O', 'O', 'O'],
      5=>['O', 'O', 'O', 'O', 'O', 'O', 'O', 'O', 'O', 'O', 'O', 'O', 'O', 'O', 'O', 'O'],
      6=>['O', 'O', 'O', 'O', 'O', 'O', 'O', 'O', 'O', 'O', 'O', 'O', 'O', 'O', 'O', 'O'],
      7=>['O', 'O', 'O', 'O', 'O', 'O', 'O', 'O', 'O', 'O', 'O', 'O', 'O', 'O', 'O', 'O'],
      8=>['O', 'O', 'O', 'O', 'O', 'O', 'O', 'O', 'O', 'O', 'O', 'O', 'O', 'O', 'O', 'O']
      })
    end

  it 'canvas_scale correctly scales at 50' do
    canvas = Canvas.new
    canvas.create_canvas(4, 8)
    canvas.scale(50)
    expect(canvas.structure).to eq({
      1=>['O', 'O', 'O', 'O',],
      2=>['O', 'O', 'O', 'O',] 
      })
  end

  it 'canvas_fill_region correctly shades a region with colour' do
    canvas = Canvas.new
    canvas.create_canvas(6, 8)
    canvas.horizontal_segment(2, 7, 2, 'I')
    canvas.horizontal_segment(2, 7, 5, 'I')
    canvas.vertical_segment(2, 2, 5, 'I')
    canvas.vertical_segment(7, 2, 5, 'I')
    canvas.fill_region(4, 5, 'I')
    expect(canvas.structure).to eq({
      1=>['O', 'O', 'O', 'O', 'O', 'O', 'O', 'O'],
      2=>['O', 'I', 'I', 'I', 'I', 'I', 'I', 'O'],
      3=>['O', 'I', 'I', 'I', 'I', 'I', 'I', 'O'],
      4=>['O', 'I', 'I', 'I', 'I', 'I', 'I', 'O'],
      5=>['O', 'I', 'I', 'I', 'I', 'I', 'I', 'O'],
      6=>['O', 'O', 'O', 'O', 'O', 'O', 'O', 'O'],
    })
    end
end
