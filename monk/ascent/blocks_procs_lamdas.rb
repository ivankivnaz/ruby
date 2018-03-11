# Proc class is for lamda and proc
puts Proc.new {}
puts -> {}

# proc vs lamda: return
def proc_return
  Proc.new { return 'returned from a method' }.call
  return 'return'
end

puts proc_return 

def lamda_return
  lambda { return 'returned from lamda' }.call
  return 'return'
end

puts lamda_return