#Write a function that checks whether an element occurs in a list.

a = [ 1, 2, 3 ]
n = 13
def checkif(n, a)
  a.include?(n)
end

if checkif(n, a)
  puts "#{n} is in list #{a}"
else
  puts "#{n} is not in list #{a}"
end


