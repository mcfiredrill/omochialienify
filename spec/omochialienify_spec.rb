require 'omochialienify'

describe Omochialienify do
  it 'gets image size' do
    expect(Omochialienify.image_size('spec/omg.jpg')).to eq([853,1280])
  end

  it 'gets random position' do
    x,y = Omochialienify.random_position 853, 1280
    expect(x).to be > 0
    expect(x).to be < 853
    expect(y).to be > 0
    expect(y).to be < 1280
  end

  it 'omochifies an image' do
    outfile = Omochialienify.omochify 'spec/omg.jpg'
    expect(outfile).to eq 'omg_omochi.jpg'
  end
end
