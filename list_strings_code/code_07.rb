=begin
Write three functions that compute the sum of the numbers in a list: using a for-loop, a while-loop and recursion. (Subject to availability of these constructs in your language of choice.)
=end

require '../modules/rannumbers.rb'

def computeeach(a)
  sum = 0  
  a.each {|x| sum += x}
  puts "using each i get #{sum}"
end

def computewhile(a)
  i = sum = 0 
  while i < a.size
    sum += a[i]
    i += 1
  end
  puts "using while i get #{sum}"
end

def computerecusion(a, n)
  return "using recursion i get #{$summ}" if n.zero?
  $summ += a[n]
  computerecusion(a, n -1)
end


a = Rannumbers._randumarray(10)
computeeach(a)
computewhile(a)
$summ = a[0]
puts computerecusion(a, a.size - 1)

