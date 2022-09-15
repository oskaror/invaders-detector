# frozen_string_literal: true

module InvadersDetector
  class Config
    DEFAULT_FRACTION_SIZE  = 8
    MIN_SPACE_OBJECT_WIDTH = 8
    MAX_SPACE_OBJECT_WIDTH = 11
    SCANNER_SENSITIVITY    = 25
    MIN_SIMILARITY         = 81
    RADAR_MARGIN           = 4

    attr_reader :fraction_size,
                :min_space_object_width,
                :max_space_object_width,
                :scanner_sensitivity,
                :min_similarity,
                :radar_margin

    def initialize(**args)
      @fraction_size          = args[:fraction_size]          || DEFAULT_FRACTION_SIZE
      @min_space_object_width = args[:min_space_object_width] || MIN_SPACE_OBJECT_WIDTH
      @max_space_object_width = args[:max_space_object_width] || MAX_SPACE_OBJECT_WIDTH
      @scanner_sensitivity    = args[:scanner_sensitivity]    || SCANNER_SENSITIVITY
      @min_similarity         = args[:min_similarity]         || MIN_SIMILARITY
      @radar_margin           = args[:radar_margin]           || RADAR_MARGIN
    end
  end
end
