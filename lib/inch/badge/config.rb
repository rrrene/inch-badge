module Inch
  module Badge
    class Config
      GRADE_ORDER = %w(A B C U)
      GRADE_COLOR = %w(#46b01e #87ae10 #c05946 #8f7eb4)
      SECTION_WIDTH = 40 # px

      class << self
        def image_path(filename)
          File.join(Badge::ROOT, "assets", filename)
        end
      end
    end
  end
end
