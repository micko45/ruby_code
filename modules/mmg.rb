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

#confirm if a string is a palindrome
module Ampalindrone
  def Ampalindrone.checkit(s)
    testit = s.gsub(/\s+/, "").downcase
    if testit  == testit.reverse
      puts "yes \"#{s} \" is a palindrone"
    else
      puts "no \"#{s} \" is not a palindrone"
    end
  end
end
