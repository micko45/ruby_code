def _randnum
 n = (1 + rand(1000))
 return n
end

def _randumarray
  i = 0
  a = Array.new
  while i < 10
    n = _randnum
    if !a.include? n
       a.push(n)
       i += 1
    end
  end
  return a
end

a = _randumarray

puts a
  
  

