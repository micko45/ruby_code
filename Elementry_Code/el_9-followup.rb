#let the compter guess a secret number

def _guess_num(n, guess)
  if guess == n
    a = "y"
    return a
  end
end

def _autocheck
  n = (1 + rand(1000000))
  a = (1..1000000).to_a
  a.each do |guess| 
    if (_guess_num(n, guess)) == "y"
      puts "found it #{n}"
    end
  end
end
  
_autocheck
