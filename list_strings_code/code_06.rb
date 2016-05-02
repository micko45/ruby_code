#function that computes the running total of a list.
require '../modules/rannumbers.rb'

def compute_total(a)
  sum = 0
  a.each { |x| sum += x }
  puts sum
end

compute_total(Rannumbers._randumarray(10))
compute_total(Rannumbers._randumarray(100))
compute_total(Rannumbers._randumarray(1000))
compute_total(Rannumbers._randumarray(10090))
