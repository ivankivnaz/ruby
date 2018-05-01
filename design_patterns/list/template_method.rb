# Define the skeleton of an algorithm in an operation, 
# deferring some steps to subclasses. Template methods lets subclasses 
# redefine certain steps of an algorithm without changing the algorithm's structure.

class AbstractClass
  def initialize
    @data = 'some data'  
  end
  
  def template_method
    action_one
    action_two
    action_three
    action_four
  end
  
  def action_one
    puts "required action #{@data}"
  end
  
  def action_two
  end
  
  def action_three
  end

  def action_four
  end
end

class SubclassOne < AbstractClass  
  def action_two
    puts 'ovveridden method'
  end

  def action_three
    puts 'ovveridden method'
  end
end


class SubclassTwo < AbstractClass
end

object = SubclassOne.new
object.template_method
object = SubclassTwo.new
object.template_method
