#Gernerate randome numbers
module Randomize
  def Randomize._rand(a)
  randomarray = Array.new
    while randomarray.size != a.size
      n = a[rand(a.size)]
     if !randomarray.include?(n)
        randomarray.push(n) 
      end
    end
  return randomarray
  end
end

#puts Randomize._rand((0..90).to_a)
