require 'spec_helper'

describe MinesField::Mine do
  let(:mine1) { described_class.new(1, 1, 1) }
  let(:mine2) { described_class.new(2, 2, 1) }
  let(:mine3) { described_class.new(3, 4, 5) }
  subject { mine1 }

  describe '.detonate?' do
    context 'when two mines are located inside blast radius' do
      it { expect(subject.detonate?(mine3)).to be true }
    end

    context 'when two mines are located outside blast radius' do
      it { expect(subject.detonate?(mine2)).to be false }
    end
  end

  describe '.distance' do
    let(:distance) { 1.4142 }

    it 'can be solved with Euclidean distance' do
      expect(subject.send(:distance, mine2).round(4)).to eq distance
    end
  end

  describe '.to_s' do
    it 'display all record attributes divided by empty space' do
      expect(subject.to_s).to eq "#{subject.x} #{subject.y} #{subject.blast_radius}"
    end
  end
end
