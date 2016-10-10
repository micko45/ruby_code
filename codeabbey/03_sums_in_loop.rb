def get_nums
   a = $stdin.gets.chomp.split(" ")
end

def sum_nums(a)
  sum = 0
  sum  = a[0].to_i + a[1].to_i
end

i = 0
times = $stdin.gets.chomp.to_i
num_arry = Array.new

while i < times 
  num_arry.push(sum_nums(get_nums))
  i += 1
end

num_arry.each {|x| print x, " "}
puts
