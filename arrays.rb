#Create Arrays

a = Array.new

a = []

a = [ "1", "2", ]


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
