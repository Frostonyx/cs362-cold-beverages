class WaterDispenser

  attr_reader :reservoir

  def initialize(reservoir)
    @reservoir = reservoir
  end

  def dispense(vessel)
    reservoir.drain(vessel.volume)
#not really sure this is what we're going for, but reservoir.fill isn't working the way I think it should
    reservoir.current_water_volume = reservoir.capacity
  end

end
