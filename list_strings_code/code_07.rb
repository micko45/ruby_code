=begin
Three functions that compute the sum of the numbers
in a list: using a for-loop, a while-loop and recursion.
=end
require '../modules/rannumbers.rb'

a = Rannumbers._randumarray(2320)
$summ = 0

def compute_each(a)
  sum = 0  
  a.each {|x| sum += x}
  puts "I get #{sum} using each"
end

def compute_while(a)
  i = sum = 0 
  while i < a.size
    sum += a[i]
    i += 1
  end
  puts "I get #{sum} using while"
end

def compute_recusion(a, n)
  if n == 0
     $summ += a[0]
     return "I get #{$summ} using recursion"
  end
  $summ += a[n]
  compute_recusion(a, n -1)
end


compute_each(a)
compute_while(a)
puts compute_recusion(a, a.size - 1)
