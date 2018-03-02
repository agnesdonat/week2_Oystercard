require 'journey_log'

describe JourneyLog do
let(:entry_station) { double :entry_station}
let(:exit_station) {double :exit_station}

  describe '#start' do
    it 'logs entry station' do
      subject.start(:entry_station)
      expect(subject.journey_class.journey).to eq ([{:entry_station => :entry_station}])
    end
  end

  describe '#finish' do
    it 'logs exit station' do
      subject.start(:entry_station)
      subject.finish(:exit_station)
      expect(subject.journey_class.journey).to eq ([{:entry_station => :entry_station, :exit_station => :exit_station}])
    end
  end

  describe '#journey' do
    it 'returns list of previous journey' do
      expect(subject.journey_class.journey).to eq []
    end
  end

end
