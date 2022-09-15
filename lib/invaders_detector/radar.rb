# frozen_string_literal: true

module InvadersDetector
  class Radar
    def initialize(file:, config: Config.new)
      @file       = file
      @config     = config
      @line_index = 0
      @fraction   = []
    end

    def each_fraction
      prepare_start_fraction

      loop do
        line = fetch_next_line

        yield(fraction, line_index)

        update_fraction if should_shift_line?
        break if no_more_data?(line)
      end

      file.rewind
    end

    private

    attr_reader :file, :config, :line_index, :fraction

    def prepare_start_fraction
      config.radar_margin.times { @fraction << file.gets(chomp: true) }
    end

    def fetch_next_line
      line = file.gets(chomp: true)
      fraction << line if line
      line
    end

    def update_fraction
      fraction.shift
      @line_index += 1
    end

    def should_shift_line?
      fraction.size == config.fraction_size || line_index >= 1
    end

    def no_more_data?(line)
      line.nil? && fraction.compact.size <= config.radar_margin
    end
  end
end
