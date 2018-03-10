# infinite loop
counter = 0
loop do
  puts "I will be eveluated infinite number of times"
  counter += 1
  break if counter >= 5
end

# times loop
5.times do
  puts "I am times loop"
end