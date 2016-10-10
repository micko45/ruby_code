num_to_get = $stdin.gets.chomp.to_i

def sum(x, y)
  return x / y
end
  
i = 0
data = []
while i < num_to_get
  a = $stdin.gets.chomp.split.map(&:to_f)
  data.push(sum(a[0], a[1]).round)
  i += 1
end

data.each {|x| print x, " "}
puts
