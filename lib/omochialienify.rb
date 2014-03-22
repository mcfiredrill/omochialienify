require 'omochialienify/version'
require 'cocaine'

module Omochialienify
  OMOCHIS = [
    File.expand_path("omochis/fusa2.png", File.dirname(__FILE__)),
    File.expand_path("omochis/fusa3.png", File.dirname(__FILE__)),
    File.expand_path("omochis/fusa4.png", File.dirname(__FILE__)),
    File.expand_path("omochis/fusa5.png", File.dirname(__FILE__)),
    File.expand_path("omochis/fusa6.png", File.dirname(__FILE__)),
    File.expand_path("omochis/fusa7.png", File.dirname(__FILE__)),
    File.expand_path("omochis/fusa8.png", File.dirname(__FILE__)),
    File.expand_path("omochis/fusa9.png", File.dirname(__FILE__)),
    File.expand_path("omochis/fusa10.png", File.dirname(__FILE__)),
  ]

  class << self
    def random_position width, height
      x = rand width
      y = rand height
      [x,y]
    end

    def random_position_string width, height
      x, y = random_position width, height
      "25%x25%+#{x}+#{y}"
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
      line = Cocaine::CommandLine.new 'convert', ":infile -size 100% :omochi1 -geometry :pos1 -composite :omochi2 -geometry :pos2 -composite :omochi3 -geometry :pos3 -composite :omochi4 -geometry :pos4 -composite :outfile"
      ext = File.extname image
      dir = File.dirname image
      outfile = "#{dir}/#{File.basename(image, ext)}_omochi#{ext}"
      puts outfile
      width, height = image_size image

      line.run infile: image, omochi1: random_omochi, omochi2: random_omochi,
               omochi3: random_omochi, omochi4: random_omochi, pos1: random_position_string(width, height),
               pos2: random_position_string(width, height),
               pos3: random_position_string(width, height), pos4: random_position_string(width, height),
               outfile: outfile
      outfile
    end
  end
end
