#Function that takes a list of strings an prints them, one per line, in a rectangular frame
require '../modules/mmg'

a = %w[ This is a really big tng stageroususa ]
n = 0

a.each do |x|
  if n < x.size
    n = x.size
  end
end
a.each do |y|
  printf("* %-#{n}s *\n", y)
end
