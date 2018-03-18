# embedding wheel class in gear, to move diameter dependency from gear to wheel
class Gear
  attr_reader :chainring, :cog, :wheel

  def initialize(chainring, cog, rim, tire)
    @chainring = chainring
    @cog = cog
    @wheel = Wheel.new(rim, tire)
  end

  def ratio
    chainring / cog.to_f
  end

  def gear_inches
    ratio * wheel.diameter
  end

  Wheel = Struct.new(:rim, :tire) do
    def diameter
      rim + (tire * 2)
    end
  end
end

puts a = Gear.new(52, 11, 26, 1.5).gear_inches
puts b = Gear.new(52, 11, 24, 1.25).gear_inches
# puts a.methods