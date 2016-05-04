#!/usr/bin/env ruby
#Bubble sort and binary search

require '../modules/mmg.rb'

a = Randomize._rand((0..90).to_a)
puts "unsorted: #{a}"

(a.size).times do 
  i = 0
  while i < (a.size - 1)
    if a[i] > a[i+1]
      a[i], a[i + 1] = a[i+1], a[i]
    end
    i += 1
  end
end

puts "  sorted: #{a}"
#printf("%2d * %2d = %4s\n", n, n, (n * n))

