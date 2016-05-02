def _randnum
 n = (1 + rand(1000000))
end

def _randumarray
  i = 0 
  a = Array.new
  while i < 1000
    n = _randnum
    if !a.include?(n)
       a.push(n)
       i += 1
    end
  end
  return a
end

a = _randumarray

puts "Random Array is #{a}"
puts "Highest number is #{a.sort.pop}"
