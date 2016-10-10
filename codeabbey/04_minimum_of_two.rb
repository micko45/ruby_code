$bigger = []

def return_bigger(a, b)
  if a > b
    return b
  else 
    return a
  end
end
  
def get_num
  a = $stdin.gets.chomp.split  
  $bigger.push(return_bigger(a[0].to_i, a[1].to_i))
end

(1..$stdin.gets.chomp.to_i).each {get_num}

$bigger.each {|x| print x, " "}
puts
