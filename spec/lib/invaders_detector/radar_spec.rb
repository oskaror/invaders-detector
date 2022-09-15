# frozen_string_literal: true

require 'spec_helper'

RSpec.describe InvadersDetector::Radar do
  subject { described_class.new(file: file, config: config) }

  let(:path) { 'spec/fixtures/example_radar' }
  let(:file) { File.open(path) }
  let(:config) do
    instance_double(InvadersDetector::Config, fraction_size: 8, radar_margin: 4)
  end

  it 'splits radar file into fractions' do
    expect { |b| subject.each_fraction(&b) }.to yield_control.exactly(49).times
  end

  context 'with short example radar' do
    let(:path) { 'spec/fixtures/short_example_radar' }

    it 'yields only once' do
      expect { |b| subject.each_fraction(&b) }.to yield_control.exactly(7).times
    end
  end
end
