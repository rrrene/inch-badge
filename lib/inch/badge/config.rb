module Inch
  module Badge
    class Config
      GRADE_ORDER = %w(U C B A)
      SECTION_WIDTH = 40 # px

      class << self
        def image_path(filename)
          File.join(Badge::ROOT, "assets", filename)
        end
      end
    end
  end
end
