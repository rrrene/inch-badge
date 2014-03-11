module Inch
  module Badge
    class GradeSection < Struct.new(:name, :color, :size, :overall)
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
  end
end
