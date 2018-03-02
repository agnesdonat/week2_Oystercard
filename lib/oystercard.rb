require 'station'
# require 'journey'

class Oystercard

  MAX_BALANCE = 90
  MIN_FARE = 1
  attr_reader :balance, :entry_station, :journey_history

  def initialize(balance = 0, journey = Journey.new)
    @balance = balance
    #@entry_station = nil
    @journey = journey
    end

  def top_up(amount)
    fail "You can't top up as it exceeds the limit" if @balance + amount > MAX_BALANCE
    @balance += amount
  end

  def touch_in(station = Station.new("Aldgate East", 1))
    raise "Insufficient funds" if @balance < MIN_FARE
    #@entry_station = station
    @journey.add_entry(station)
  end

  def touch_out(station2 = Station.new("Earl's Court",1))
    deduct(MIN_FARE)
    @journey.add_exit(station2)
    #@entry_station = nil
  end

  def in_journey?
    !@entry_station = nil
  end

  private

  def deduct(fare)
    @balance -= fare
  end

end
