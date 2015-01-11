require 'erb'

module Inch
  module Badge
    module Image
      class SVG < Base
        def save
          add_n_grade! if empty_badge?

          template_content = File.read( Config.image_path(badge_template) )
          renderer = ERB.new(template_content)
          output = renderer.result(binding)

          File.open(@filename, 'w') {|f| f.write(output) }
        end

        private

        def add_n_grade!
          @grades << GradeSection.new('N', '#9B9B9B', 100, 100)
        end

        def badge_template
          "badge-#{style}.svg.erb"
        end

        def empty_badge?
          @numbers == [0,0,0,0]
        end

        def load_image(filename)
          @cache ||= {}
          @cache[filename] ||= ChunkyPNG::Image.from_file(filename)
          @cache[filename]
        end
      end
    end
  end
end
