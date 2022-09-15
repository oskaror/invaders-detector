# frozen_string_literal: true

module InvadersDetector
  class Scanner
    def initialize(config: Config.new)
      @config        = config
      @space_objects = []
    end

    def search_space_objects(radar_fraction, fraction_index)
      available_positions(radar_fraction).times do |column_index|
        radar_fragment = fetch_radar_fragment(radar_fraction, column_index)
        next unless contains_space_object?(radar_fragment)

        @space_objects << SpaceObject.new(
          coordinate_x: column_index,
          coordinate_y: fraction_index,
          bitmap: radar_fragment
        )
      end

      space_objects
    end

    private

    attr_reader :config, :space_objects

    def available_positions(radar_fraction)
      radar_fraction.first.size - config.min_space_object_width
    end

    def fetch_radar_fragment(radar_fraction, index)
      radar_fraction.map do |line|
        line[index...(index + config.max_space_object_width)]
      end
    end

    def contains_space_object?(radar_sample)
      radar_sample.map { |s| s.count('o') }.sum > config.scanner_sensitivity
    end
  end
end
