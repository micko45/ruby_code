#Create Arrays


a = Array.new

a = []

a = [ "1", "2", ]

a = %w(foo bar)


#convert string to array

s = "1 2 3"

a = s.split(" ")


#Iterate through an Array

a = [ "1", "2", ]

a.each do | s | 
  puts s
end

#Remove first element of array
s = "one two three"
a = s.split(" ")
a.shift
puts a

 = Array.new

while n < 5
  n += 1
  a.push(n)
  puts a
end

#Random array of 10 nums between 1 and 1000
def _randnum
 n = (1 + rand(1000))
 end

 def _randumarray
   i = 0
   a = Array.new
   while i < 10
     n = _randnum
     if !a.include?(n)
       a.push(n)
       i += 1
     end
  end
  return a
end

a = _randumarray

puts "Random Array is #{a}"
puts "Highest number is #{a.sort.pop}"

