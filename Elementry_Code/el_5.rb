puts "Enter an num and i will count to it:"
n = gets.chomp.to_i
i = 0

if ((n % 5) == 0)  || ((n % 3) == 0 ) 
  puts "printhing out the nums\n"
  while  i < n 
    i += 1
    puts i
  end
else 
  puts "Number not dividable by 3 or 5"
end
