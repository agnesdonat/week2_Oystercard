
class Journey
  attr_accessor :journey

  def initialize
    @journey = []
  end

  def add_entry(station)
    @journey.push(entry_station: station)
  end

  def add_exit(station)
   @journey.last[:exit_station] = station
  end

  def fare
    if @journey[-1].key?(:entry_station) && @journey[-1].key?(:exit_station)
      return -1
    else
      return -6
    end
  end
end
