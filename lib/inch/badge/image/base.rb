module Inch
  module Badge
    module Image
      class Base
        attr_reader :style

        def initialize(filename, numbers, style = :default)
          @filename = filename
          @numbers = numbers.map(&:to_i)
          @style = style
          @overall = @numbers.inject(0, :+)
          @grades = Config::GRADE_ORDER.map.with_index do |name, index|
              GradeSection.new(name, Config::GRADE_COLOR[index], @numbers[index], @overall)
            end
        end
      end
    end
  end
end
