# frozen_string_literal: true

require 'spec_helper'

RSpec.describe InvadersDetector::App do
  subject { described_class.new.call('spec/fixtures/example_radar') }

  describe '#call' do
    # TODO: precise output testing
    it 'prints results' do
      expect { subject }.to output.to_stdout
    end
  end
end
