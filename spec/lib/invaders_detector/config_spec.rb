# frozen_string_literal: true

require 'spec_helper'

RSpec.describe InvadersDetector::Config do
  subject { described_class.new }

  describe '#fraction_size' do
    it 'returns the fraction_size value' do
      expect(subject.fraction_size).to eq(8)
    end
  end

  describe '#min_space_object_width' do
    it 'returns the min_space_object_width value' do
      expect(subject.min_space_object_width).to eq(8)
    end
  end

  describe '#max_space_object_width' do
    it 'returns the max_space_object_width value' do
      expect(subject.max_space_object_width).to eq(11)
    end
  end

  describe '#scanner_sensitivity' do
    it 'returns the scanner_sensitivity value' do
      expect(subject.scanner_sensitivity).to eq(25)
    end
  end

  describe '#min_similarity' do
    it 'returns the min_similarity value' do
      expect(subject.min_similarity).to eq(81)
    end
  end

  describe '#radar_margin' do
    it 'returns the radar_margin value' do
      expect(subject.radar_margin).to eq(4)
    end
  end
end
