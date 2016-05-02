#returns the elements on odd positions in a list.
require '../modules/rannumbers.rb'

a = Rannumbers._randumarray(100)
i = 1

while i < (a.size + 1)
  puts a[i]
  i += 2
end
  
