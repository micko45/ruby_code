=begin
Write a function that computes the list of the first 100 Fibonacci numbers.
=end

def show_fibonacci
  i = 1
  fibonacci = Array.new
  (1..100).each do |x| 
print "#{i} + ", i + (i + 1), "\n"
    fibonacci.push(i + (i + 1))
    i += 1
  end
  return fibonacci
end
  
  show_fibonacci
