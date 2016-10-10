#!/usr/bin/env ruby
attempts = $stdin.gets.chomp.to_i

def compute(x, y, z)
  if x +y > z and x + z > y and y + z > x
    return 1
  else 
    return 0
  end 
end

final_data = []
(1..attempts).each do 
   a = $stdin.gets.chomp.split.map(&:to_i)
   final_data.push(compute(a[0], a[1], a[2]))
end

final_data.each {|result| print result, " "}
puts
