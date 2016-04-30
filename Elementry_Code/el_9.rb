#guess a secret number

def _guess_num(n, guess)
  if guess == n
    a = "y"
  end
end

def _getinput
  n = (1 + rand(10))
  counter = 10
  puts "So we have a number between 1 and 10\n"
  puts "Can you guess \n "
  guesses = Array.new
  while counter !=  0
  puts "you have #{counter} trys left:-"
    guess = $stdin.gets.chomp.to_i
    if (_guess_num(n, guess)) == "y"
      puts "you did it"
      exit (0)
    end
    if guesses.include? guess
      puts "you allready tried that"
    else  
      counter -= 1
      guesses.push(guess)
    end
  end
puts n 
end

_getinput
