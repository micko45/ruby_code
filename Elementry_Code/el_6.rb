i = sum = 0
a = Array.new

puts "Please type in a number: "
n = $stdin.gets.chomp.to_i

puts "Do you want AVERAGE(A) or SUM(S)" 
answer = $stdin.gets.chomp

while i != n 
  i += 1
  a.push(i)
  sum+=i
end

if  answer == "A" 
  puts "Tha Average is ", sum / a.size
elsif  answer == "S"
  puts "Tha Sum is ", sum 
else
  puts "Please answer AVERAGE or SUM"
end
