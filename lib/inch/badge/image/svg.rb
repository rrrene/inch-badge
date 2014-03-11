require 'erb'

module Inch
  module Badge
    module Image
      class SVG < Base
        def save
          template_content = File.read( Config.image_path('badge.svg.erb') )
          renderer = ERB.new(template_content)
          output = renderer.result(binding)

          File.open(@filename, 'w') {|f| f.write(output) }
          return

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
