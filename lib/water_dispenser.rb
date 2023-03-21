class WaterDispenser

  attr_reader :reservoir

  def initialize(reservoir)
    @reservoir = reservoir
  end

  def dispense(vessel)
    reservoir.drain(vessel.volume)
    #not really sure this is what we're going for
    vessel.fill()
  end

end
