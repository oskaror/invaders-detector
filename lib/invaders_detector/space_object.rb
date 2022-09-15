# frozen_string_literal: true

module InvadersDetector
  class SpaceObject
    INVADERS_BITMAPS = [
      [
        '--o-----o--',
        '---o---o---',
        '--ooooooo--',
        '-oo-ooo-oo-',
        'ooooooooooo',
        'o-ooooooo-o',
        'o-o-----o-o',
        '---oo-oo---'
      ],
      [
        '---oo---',
        '--oooo--',
        '-oooooo-',
        'oo-oo-oo',
        'oooooooo',
        '--o--o--',
        '-o-oo-o-',
        'o-o--o-o'
      ]
    ].freeze

    def initialize(coordinate_x:, coordinate_y:, bitmap: nil)
      @coordinate_x = coordinate_x
      @coordinate_y = coordinate_y
      @bitmap       = bitmap
    end

    def coordinates
      { x: coordinate_x, y: coordinate_y }
    end

    def width
      bitmap.first.size
    end

    def height
      bitmap.size
    end

    attr_reader :bitmap, :coordinate_x, :coordinate_y
  end
end
