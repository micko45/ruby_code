#Function that takes a number and returns a list of its digits.

n = (1 + rand(1000000)).to_s
a =  n.split("").map {|s| s.to_i }

puts a
