
module Inch
  module Badge
    module Image
      def self.create(filename, numbers)
        if filename =~ /\.png$/
          PNG.new(filename, numbers).save
        elsif filename =~ /\.svg$/
          SVG.new(filename, numbers).save
        else
          raise "Unknown data format: #{filename}"
        end
      end
    end
  end
end

require_relative 'image/base'
require_relative 'image/png'
require_relative 'image/svg'
