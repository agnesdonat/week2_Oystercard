class JourneyLog

  attr_reader :journey_class

 def initialize(journey_class = Journey.new)
   @journey_class = journey_class

 end


def start(station1)
  @journey_class.add_entry(station1)
end

def finish(station2)
  @journey_class.add_exit(station2)
end

def journeys
  @journey_class.journeys 
end

end
