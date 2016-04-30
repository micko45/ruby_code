#Write a program that prints a multiplication table for numbers up to 12.

#a = (1..12).to_a
i = 0

while i != 13
  (1..12).each do |x| 
    total = (i * x)
    puts "#{i} X #{x} = #{total}"
  end
    i += 1
end

