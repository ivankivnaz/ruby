# use || operator to explicitely define default values
class Gear
  attr_reader :chainring, :cog, :wheel

  def initialize(args)
    @chainring = args[:chainring] || 40
    @cog = args[:cog] || 18
    @wheel = args[:wheel]
  end
end

Gear.new(chainring: 52, cog: 14, wheel: Wheel.new(26, 1.5)).gear_inches

# use fetch method instead of || for boolean defaults, fetch doesn't return nil
class Gear
  attr_reader :chainring, :cog, :wheel

  def initialize(args)
    @chainring = args.fetch(:chainring, 40)
    @cog = args.fetch(:cog, 18)
    @wheel = args[:wheel]
  end
end

Gear.new(chainring: 52, cog: 14, wheel: Wheel.new(26, 1.5)).gear_inches

# for complex params use seperate method
class Gear
  attr_reader :chainring, :cog, :wheel

  def initialize(args)
    args = defaults.merge(args)
    @chainring = args[:chainring]
    @cog = args[:cog]
    @wheel = args[:wheel]
  end

  def defaults
    {:chainring => 40, :cog => 18}
  end
end

Gear.new(chainring: 52, cog: 14, wheel: Wheel.new(26, 1.5)).gear_inches