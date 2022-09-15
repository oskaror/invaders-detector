# frozen_string_literal: true

require 'spec_helper'

RSpec.describe InvadersDetector::SpaceObject do
  subject { described_class.new(coordinate_x: 1, coordinate_y: 1, bitmap: bitmap) }

  let(:bitmap) do
    [
      '-o-',
      'ooo',
      '-o-',
      'o-o'
    ]
  end

  describe '#coordinates' do
    it 'returns coordinates of space object' do
      expect(subject.coordinates).to eq({ x: 1, y: 1 })
    end
  end

  describe '#width' do
    it 'returns width of space object' do
      expect(subject.width).to eq(3)
    end
  end

  describe '#height' do
    it 'returns height of space object' do
      expect(subject.height).to eq(4)
    end
  end

  describe '#INVADERS_BITMAPS' do
    it 'returns invaders bitmaps' do
      expect(described_class::INVADERS_BITMAPS).to be_an_all(Array)
    end
  end
end
