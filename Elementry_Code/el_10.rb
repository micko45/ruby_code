#program that prints the next 20 leap years.

thisyear = Time.new.year
i = 1

while i < 20
  puts thisyear
  thisyear += 4
  i += 1
end
