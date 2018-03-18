
# - depends on data array structure
class ObscuringReferences
  attr_reader :data

  def initialize(data)
    @data = data
  end

  def diameters
    # 0 is rim, 1 is tire
    data.collect { |cell| cell[0] + (cell[1] * 2) }
  end
end

# rim and tire sizes (now in millimeters!) in a 2d array
@data = [[622, 20], [622, 23], [559, 30], [559, 40]]

# + the only dependent thing is wheelify method which is easy to change
# + usage of Struct helps to create lightweight objects with attr_accessors
class RevealingReferences
  attr_reader :wheels

  def initialize(data)
    @wheels = wheelify(data)
  end

  # first - iterate over the array
  def diameters
    wheels.collect {|wheel| diameter(wheel)}
  end

  # second - calculate diameter of ONE wheel
  def diameter(wheel)
    wheel.rim + (wheel.tire * 2))
  end
  # ... now everyone can send rim/tire to wheel

  Wheel = Struct.new(:rim, :tire)
  def wheelify(data)
    data.collect { |cell| Wheel.new(cell[0], cell[1]) }
  end
end