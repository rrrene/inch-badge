module Inch
  module Badge
    module Image
      class Base
        def initialize(filename, numbers)
          @filename = filename
          @numbers = numbers.map(&:to_i)
          @overall = @numbers.inject(0, :+)
          @grades = Config::GRADE_ORDER.map.with_index do |name, index|
              GradeSection.new(name, Config::GRADE_COLOR[index], @numbers[index], @overall)
            end
        end
      end
    end
  end
end
