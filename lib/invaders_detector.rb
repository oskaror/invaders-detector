# frozen_string_literal: true

Dir['./lib/invaders_detector/*.rb'].sort.each { |file| require file }

module InvadersDetector
  class App
    def call(radar_path)
      file = File.open(radar_path, 'r')

      radar      = Radar.new(file: file)
      scanner    = Scanner.new
      identifier = InvadersIdentifier.new

      space_objects = []

      radar.each_fraction do |fraction, fraction_index|
        space_objects = scanner.search_space_objects(fraction, fraction_index)
      end

      space_objects.select! { |object| identifier.recognise_invader?(object) }

      Printer.new(file).print_invaders(space_objects)
    end
  end
end
