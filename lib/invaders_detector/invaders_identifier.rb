# frozen_string_literal: true

module InvadersDetector
  class InvadersIdentifier
    def initialize(known_invaders = SpaceObject::INVADERS_BITMAPS, config: Config.new)
      @known_invaders = known_invaders
      @config         = config
    end

    def recognise_invader?(space_object)
      known_invaders.each do |invader_bitmap|
        object_bitmap  = adjust_object_bitmap(space_object, invader_bitmap)
        invader_bitmap = adjust_invader_bitmap(space_object, invader_bitmap)
        similarity     = calculate_similarity(object_bitmap, invader_bitmap)

        return true if similarity >= config.min_similarity
      end

      false
    end

    private

    attr_reader :known_invaders, :config

    def adjust_object_bitmap(space_object, invader_bitmap)
      return space_object.bitmap if space_object.width == invader_bitmap.first.size

      space_object.bitmap.map! do |line|
        line[0..(invader_bitmap.size - 1)]
      end
    end

    def adjust_invader_bitmap(space_object, invader_bitmap)
      return invader_bitmap if space_object.bitmap.size == invader_bitmap.size

      if space_object.coordinate_y > config.fraction_size
        to = space_object.bitmap.size - 1
        invader_bitmap[0..to]
      else
        from = invader_bitmap.size - space_object.bitmap.size
        invader_bitmap[from..invader_bitmap.size]
      end
    end

    def calculate_similarity(space_object, invader)
      similarity = 0

      space_object.join.each_char.with_index do |char, index|
        similarity += 1 if char == invader.join[index]
      end

      (similarity.to_f / invader.join.size) * 100
    end
  end
end
