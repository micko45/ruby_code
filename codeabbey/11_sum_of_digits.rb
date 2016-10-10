#!/usr/bin/env ruby

amount = gets.chomp.to_i
#amount = $stdin.gets.chomp.to_i

def get_digets(num) 
  a = []
  sum = 0
  while num != 0
    a.push(num % 10)
    num = num / 10
  end
  a.each {|x| sum += x }
  return sum
end

final_data = []
(1..amount).each do 
  a = $stdin.gets.chomp.split.map(&:to_i)
  final_data.push(get_digets(a[0] * a[1] + a[2]))
end

final_data.each {|x| print x, " "}
puts
