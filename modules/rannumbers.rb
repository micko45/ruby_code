#Gernerate randome numbers
module Rannumbers
  def Rannumbers._randnum(n)
    range = (n * 100)
    n = (1 + rand(range))
  end

  def Rannumbers._randumarray(amount)
    i = 0 
    a = Array.new
    while i < amount
      n = Rannumbers._randnum(a.size + 1)
      if !a.include?(n)
       a.push(n)
         i += 1
      end
    end
    return a
  end
end
