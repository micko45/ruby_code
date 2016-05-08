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

module Printinbox
  def Printinbox.repeating(timest)
   (timest).times {print "*"}
   print "\n"
  end

  def Printinbox.stringsize(a)
    n = 0
    a.each do |x|
      if n < x.size
        n = x.size
      end
    end
    return n
  end

  def Printinbox.printout(a, n)
    repeating(n + 4)
    a.each do |y|
      printf("* %-#{n}s *\n", y)
    end
    repeating(n + 4)
  end
end
