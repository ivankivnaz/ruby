class Gear
  attr_reader :chainring, :cog, :rim, :tire

  def initialize(chainring, cog, rim, tire)
    @chainring = chainring
    @cog = cog
    @rim = rim
    @tire = tire
  end

  def gear_inches
    ratio * Wheel.new(rim, tire).diameter
  end

  def ratio
    chainring / cog.to_f
  end

  # ...
end

class Wheel
  attr_reader :rim, :tire

  def initialize(rim, tire)
    @rim = rim
    @tire = tire
  end

  def diameter
    rim + (tire * 2)
  end

  # ...
end

Gear.new(52, 11, 26, 1.5).gear_inches

# dependencies
# 1. name of another class (Wheel)
# 2. name of a method of that another class (diameter)
# 3. arguments that should be passed to the class (rim, tire)
# 4. arguments order that should be passed to the class (rim, tire)