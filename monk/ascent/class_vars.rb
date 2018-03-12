# usage example
class Planet
  @@planets_count = 0
    
  def initialize(name)
    @name = name
    @@planets_count += 1
  end
  
  def self.planets_count
    @@planets_count
  end  
end

Planet.new("earth"); Planet.new("uranus")

p Planet.planets_count

# using to store application configuration
class ApplicationConfiguration
  @@configuration = {}

  def self.set(property_name, value)
    @@configuration[property_name] = value
  end
  
  def self.get(property_name)
    @@configuration[property_name]
  end  
end

ApplicationConfiguration.set("name", "Demo Application")
ApplicationConfiguration.set("version", "0.1")

p ApplicationConfiguration.get("version")


# using inheritence for multiple configs from class instance variables
class ApplicationConfiguration
  @configuration = {}

  def self.set(property, value)
    @configuration[property] = value
  end

  def self.get(property)
    @configuration[property]
  end
end

class ERPApplicationConfiguration < ApplicationConfiguration
  @configuration = {}
end

class WebApplicationConfiguration < ApplicationConfiguration
  @configuration = {}
end

ERPApplicationConfiguration.set("name", "ERP Application")
WebApplicationConfiguration.set("name", "Web Application")

p ERPApplicationConfiguration.get("name")
p WebApplicationConfiguration.get("name")

p ApplicationConfiguration.get("name")
