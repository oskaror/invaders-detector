# frozen_string_literal: true

require 'spec_helper'

RSpec.describe InvadersDetector::Printer do
  subject { described_class.new(file).print_invaders([space_object]) }

  let(:path) { 'spec/fixtures/short_example_radar' }
  let(:file) { File.open(path) }
  let(:space_object) do
    instance_double(InvadersDetector::SpaceObject,
                    coordinate_x: 2,
                    coordinate_y: 0,
                    width: 2,
                    height: 2)
  end

  # TODO: precise output testing
  it 'prints radar with invaders' do
    expect { subject }.to output.to_stdout
  end
end
