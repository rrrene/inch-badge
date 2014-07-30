
module Inch
  module Badge
    module Image
      def self.create(filename, numbers, options = {})
        style = options.fetch(:style, 'default')
        if filename =~ /\.png$/
          PNG.new(filename, numbers, style).save
        elsif filename =~ /\.svg$/
          SVG.new(filename, numbers, style).save
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
