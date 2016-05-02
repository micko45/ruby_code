=begin
Write a program that prints a multiplication table for numbers up to 12.
=end

i = 0
while i != 13
  (0..12).each do |x|
    printf("%2d * %2d = %4d\n", i, x, (i * x))
  end
  puts "==============="
  puts "==============="
    i += 1
end
