#program that prints the next 20 leap years.
require 'date'

year = DateTime.now.year
i = 1

while i < 21
  if Date.leap?(year)
    puts year
    i += 1
  end
  year += 1
end
