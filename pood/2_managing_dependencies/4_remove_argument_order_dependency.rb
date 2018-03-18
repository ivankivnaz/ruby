# class depends on argument order
class Gear
  attr_reader :chainring, :cog, :wheel

  def initialize(chainring, cog, wheel)
    @chainring = chainring
    @cog = cog
    @wheel = wheel
  end
end

Gear.new(52, 14, Wheel.new(26, 1.5)).gear_inches

# use hash in params to avoid argument order dependency
class Gear
  attr_reader :chainring, :cog, :wheel

  def initialize(args)
    @chainring = args[:chainring]
    @cog = args[:cog]
    @wheel = args[:wheel]
  end
end

Gear.new(chainring: 52, cog: 14, wheel: Wheel.new(26, 1.5)).gear_inches