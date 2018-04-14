# the main mistake of composite dp is that people often think that composite
# objects are leafs of the trees on the same level but each leaf can
# also consist of parts and be composite object

#
# Wrong way of doing it
#
class CompositeTask < Task
  # Lots of code omitted...
  def total_number_basic_tasks
    @sub_tasks.length
  end
end

# 
# correct way
# 

class Task
  # Lots of code omitted...
  def total_number_basic_tasks
    1
  end
end

class CompositeTask < Task
  # Lots of code omitted...
  def total_number_basic_tasks
    total = 0
    @sub_tasks.each {|task| total += task.total_number_basic_tasks}
    total
  end
end
