# frozen_string_literal: true

module InvadersDetector
  class Printer
    def initialize(file)
      @file = file
    end

    def print_invaders(space_objects)
      file.each_with_index do |line, line_id|
        line.split('').each_with_index do |char, column_id|
          invader = space_objects.find { |so| within?(so, column_id, line_id) }

          if invader
            printf "\e[31m#{char}\e[0m"
          else
            printf char
          end
        end
      end
    end

    private

    attr_reader :file

    def within?(space_object, coordinate_x, coordinate_y)
      coordinate_x >= space_object.coordinate_x &&
        coordinate_x <= space_object.coordinate_x + space_object.width - 1 &&
        coordinate_y >= space_object.coordinate_y &&
        coordinate_y <= space_object.coordinate_y + space_object.height - 1
    end
  end
end
