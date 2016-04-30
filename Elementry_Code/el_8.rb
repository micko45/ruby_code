#print prime numbers

def _getprime(n)
  i = 2

  while i < n
    remainder = (n % i)
    if remainder == 0
      p = "no"
    end
    i += 1
  end

  if p == "no"
    puts "#{n} is not a prime"
  else 
    if n == 2
      puts "2 is not a prime"
    else 
      puts "#{n} is a prime"
    end
  end
end

puts "please select a number"
n = $stdin.gets.chomp.to_i
i = 2

while i < n
  _getprime(i)
  i += 1
end



