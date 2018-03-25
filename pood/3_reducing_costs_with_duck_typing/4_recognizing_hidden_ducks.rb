# • Case statements that switch on class
# • kind_of? and is_a?
# • responds_to?

# case or swtich
class Trip
  attr_reader :bicycles, :customers, :vehicle

  def prepare(prepares)
    prepares.each do |preparer|
      case preparer:
      when Mechanic
        preparer.prepare_bicycles(bicycles)
      when TripCoordinator
        preparer.buy_food(customers)
      when Driver
        preparer.prepare_gas(vehicle)
        preparer.fill_water_tank(vehicle)
      end
    end
  end
end

# kind_if?, is_a?
if preparer.kind_of?(Mechanic)
  preparer.prepare_bicycles(bicycle)
elsif preparer.kind_of?(TripCoordinator)
  preparer.buy_food(customers)
elsif preparer.kind_of?(Driver)
  preparer.gas_up(vehicle)
  preparer.fill_water_tank(vehicle)
end

# responds_to?
if preparer.responds_to?(:prepare_bicycles)
  preparer.prepare_bicycles(bicycle)
elsif preparer.responds_to?(:buy_food)
  preparer.buy_food(customers)
elsif preparer.responds_to?(:gas_up)
  preparer.gas_up(vehicle)
  preparer.fill_water_tank(vehicle)
end