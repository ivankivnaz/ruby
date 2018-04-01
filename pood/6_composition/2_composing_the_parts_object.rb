class Bicycle
  attr_reader :size, :parts
  
  def initialize(args={})
    @size = args[:size]
    @parts = args[:parts]
  end
  
  def spares
    parts.spares
  end
end

class Parts
  attr_reader :parts

  def initialize(parts)
    @parts = parts
  end

  def spares
    parts.select {|part| part.needs_spare}
  end
end

class Part
  attr_reader :name, :description, :needs_spare

  def initialize(args)
    @name = args[:name]
    @description = args[:description]
    @needs_spare = args.fetch(:needs_spare, true)
  end
end

chain = Part.new(name: 'chain', description: '10-speed')
road_tire = Part.new(name: 'tire_size', description: '23')
tape = Part.new(name: 'tape_color', description: 'red')
mountain_tire = Part.new(name: 'tire_size', description: '2.1')
rear_shock = Part.new(name: 'rear_shock', description: 'Fox')
front_shock = Part.new(name: 'front_shock', description: 'Manitou', needs_spare: false)

road_bike_parts = Parts.new([chain, road_tire, tape])

road_bike = Bicycle.new(size: 'L', parts: Parts.new([chain, road_tire, tape]))
road_bike.size
# -> 'L'

road_bike.spares
# -> [#<Part:0x00000101036770
#           @name="chain",
#           @description="10-speed",
#           @needs_spare=true>,


#<Part:0x0000010102dc60
# @name="tire_size",
#
etc ...
