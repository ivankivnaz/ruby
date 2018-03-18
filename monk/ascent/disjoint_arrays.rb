# disjoint arrays - contain objects of different class
["xkcd", 9, Object.new, ["a", "clean", "array"], {:a => "hash"}].each do |e|
  puts e.class
end