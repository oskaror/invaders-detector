# frozen_string_literal: true

require 'spec_helper'

RSpec.describe InvadersDetector::InvadersIdentifier do
  subject { described_class.new(invaders_bitmaps).recognise_invader?(space_object) }

  let(:space_object) do
    InvadersDetector::SpaceObject.new(
      coordinate_x: 8,
      coordinate_y: 0,
      bitmap: space_object_bitmap
    )
  end
  let(:invaders_bitmaps) do
    [
      [
        '--o-----o--',
        '---o---o---',
        '--ooooooo--',
        '-oo-ooo-oo-',
        'ooooooooooo',
        'o-ooooooo-o',
        'o-o-----o-o',
        '---oo-oo---'
      ]
    ]
  end

  context 'with 100% coverage' do
    let(:space_object_bitmap) do
      [
        '--o-----o--',
        '---o---o---',
        '--ooooooo--',
        '-oo-ooo-oo-',
        'ooooooooooo',
        'o-ooooooo-o',
        'o-o-----o-o',
        '---oo-oo---'
      ]
    end

    it 'returns the true value' do
      expect(subject).to eq(true)
    end
  end

  context 'with different size bitmaps ' do
    let(:invaders_bitmaps) do
      [
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
      ]
    end

    let(:space_object_bitmap) do
      [
        '---oo----',
        '--oooo---',
        '-oooooo--',
        'oo-oo-oo-',
        'oooooooo-',
        '--o--o---',
        '-o-oo-o--',
        'o-o--o-o-'
      ]
    end

    it 'returns the true value' do
      expect(subject).to eq(true)
    end
  end

  context 'with top invader ' do
    let(:space_object_bitmap) do
      [
        'ooooooooooo',
        'o-ooooooo-o',
        'o-o-----o-o',
        '---oo-oo---'
      ]
    end

    it 'returns the true value' do
      expect(subject).to eq(true)
    end
  end

  context 'with 57% coverage' do
    let(:space_object_bitmap) do
      [
        [
          '--o-----o--',
          '---o---o---',
          '-----------',
          '-oo-ooo-oo-',
          '-----------',
          'o----------o',
          'o-o-----o-o',
          '---oo-oo---'
        ]
      ]
    end

    it 'returns the false value' do
      expect(subject).to eq(false)
    end
  end
end
