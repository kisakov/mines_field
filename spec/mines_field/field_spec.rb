require 'spec_helper'

describe MinesField::Field do
  let(:mine1) { MinesField::Mine.new(1, 1, 1) }
  let(:mine2) { MinesField::Mine.new(2, 2, 2) }
  let(:mine3) { MinesField::Mine.new(3, 4, 5) }
  let(:mines) { [mine1, mine2, mine3] }

  describe '#total_explosions' do
    subject { described_class.total_explosions(mines) }
    let(:expected_array) do
      [
        { mine: mine3, explosions: 2 },
        { mine: mine2, explosions: 1 },
        { mine: mine1, explosions: 0 }
      ]
    end

    it { is_expected.to eq(expected_array) }
  end

  describe '.explode_mines' do
    subject { described_class.new(mines, mine).explode_mines }

    it 'clears all mines and sets them active state' do
      expect(mines.map(&:state)).to eq(['activated'] * 3)
    end

    context 'when mines located inside blast radius' do
      let(:mine) { mine3 }
      it { is_expected.to eq(mine: mine, explosions: 2) }
    end

    context 'when mines located outside blast radius' do
      let(:mine) { mine1 }
      it { is_expected.to eq(mine: mine, explosions: 0) }
    end
  end
end
