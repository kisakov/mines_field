require 'spec_helper'

describe MinesField::Mine do
  let(:mine1) { described_class.new(1, 1, 1) }
  let(:mine2) { described_class.new(2, 2, 1) }
  subject { mine1 }

  describe '.detonate?' do
    it { expect(subject.detonate?(mine2)).to be_falsy }
  end

  describe '.distance' do
    it { expect(subject.send(:distance, mine2).round(4)).to eq 1.4142 }
  end

  describe '.to_s' do
    it { expect(subject.to_s).to eq("#{subject.x} #{subject.y} #{subject.radius}") }
  end
end
