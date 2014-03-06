require 'chunky_png'

module Inch
  module Badge
    class GradeSection < Struct.new(:name, :size, :overall)
      def prefix(x)
        if x == 0
          "begin"
        elsif x == section_width - 1
          "end"
        else
          "body"
        end
      end

      def width
        return 0 if overall == 0
        ((size / overall.to_f) * section_width).round
      end

      def section_width
        Config::SECTION_WIDTH
      end
    end

    class Image
      def initialize(filename, numbers)
        @filename = filename
        @numbers = numbers.map(&:to_i)
        @overall = @numbers.inject(0, :+)
      end

      def save
        @grades = Config::GRADE_ORDER.map.with_index do |name, index|
            GradeSection.new(name, @numbers[index], @overall)
          end

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