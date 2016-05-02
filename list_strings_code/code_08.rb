=begin
Function on_all that applies a function to every element of a list.
Use it to print the first twenty perfect squares.
=end 

def on_all(a)
  a.each {|x| getsquare(x) }
end

def getsquare(n)
  printf("%2d * %2d = %4s\n", n, n, (n * n))
end

on_all(1..20)
