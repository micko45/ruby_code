#!/usr/bin/env ruby

a = $stdin.gets.chomp.split.map(&:to_i)

def bigger(a)
  biggest = 0
  a.each { |num| biggest = num if num > biggest}
  return biggest
end
   
def smaller(a)
  smallest = a[0]
  a.each { |num| smallest = num if num < smallest}
  return smallest
end

print bigger(a), " ", smaller(a), "\n"
