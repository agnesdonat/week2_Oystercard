require 'journey'

describe Journey do
let(:station1) { double :station1 }
let(:station2) { double :station2 }

  describe '#add_entry' do
    it 'adds entry station to journey history' do
      subject.add_entry(:station1)
      expect(subject.journey).to eq ([{:entry_station => :station1}])
    end
  end

  describe '#add_exit' do
    it 'adds exit station to journey history' do
      subject.add_entry(:station1)
      subject.add_exit(:station2)
      expect(subject.journey).to eq ([{:entry_station => :station1, :exit_station => :station2}])
    end
  end

  describe '#fare' do
    it 'checks if fare return minimum' do
      subject.add_entry(:station1)
      subject.add_exit(:station2)
      expect(subject.fare).to eq -1
    end

    it 'checks if fare can charge penalty' do
      subject.add_entry(:station1)
      expect(subject.fare).to eq -6
    end
  end

end
