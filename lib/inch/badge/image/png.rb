require 'chunky_png'

module Inch
  module Badge
    module Image
      class PNG < Base
        def save
          base_image = ChunkyPNG::Image.from_file( Config.image_path('bg.png') )

          x = 0
          @grades.each do |grade|
            grade.width.times do |i|
              if x < grade.section_width
                badge  = load_image( Config.image_path("grade-#{grade.name}-#{grade.prefix(x)}.png") )
                base_image.compose!(badge, 34+x, 0)
              end
              x += 1
            end
          end

          base_image.save(@filename, :fast_rgba)
        end

        private

        def load_image(filename)
          @cache ||= {}
          @cache[filename] ||= ChunkyPNG::Image.from_file(filename)
          @cache[filename]
        end
      end
    end
  end
end
