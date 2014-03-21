require 'omochialienify/version'
require 'cocaine'

module Omochialienify
  OMOCHIS = [
    "lib/omochis/fusa1.png",
    "lib/omochis/fusa2.png",
    "lib/omochis/fusa3.png",
    "lib/omochis/fusa4.png",
    "lib/omochis/fusa5.png",
    "lib/omochis/fusa6.png",
    "lib/omochis/fusa7.png",
    "lib/omochis/fusa8.png",
    "lib/omochis/fusa9.png",
    "lib/omochis/fusa10.png",
  ]

  class << self
    def random_position width, height
      x = rand width
      y = rand height
      [x,y]
    end

    def image_size image
      line = Cocaine::CommandLine.new 'identify', ':image'
      result = line.run image: image
      result.split(' ')[2].split('x').map(&:to_i)
    end

    def random_omochi
      OMOCHIS[rand(OMOCHIS.length)]
    end

    def omochify image
      line = Cocaine::CommandLine.new 'convert', ":infile
        :omochi1 -geometry :pos1 - composite
        :omochi2 -geometry :pos2 - composite
        :omochi3 -geometry :pos3 - composite
        :omochi4 -geometry :pos4 - composite
        :outfile"
      ext = File.extname image
      outfile = "#{File.basename(image, ext)}_omochi#{ext}"
      width, height = image_size image
      puts width, height

      line.run infile: image, omochi1: random_omochi, omochi2: random_omochi,
               omochi3: random_omochi, omochi4: random_omochi, pos1: random_position(width, height).join('x'),
               pos2: random_position(width, height).join('x'),
               pos3: random_position(width, height).join('x'), pos4: random_position(width, height).join('x')
      outfile
    end
  end
end
