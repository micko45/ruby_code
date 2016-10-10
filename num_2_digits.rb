amount = $stdin.gets.chomp.to_i

def get_digets(num) 
  a = []
  while num != 0
    a.push(num % 10)
    num = num / 10
  end
end

(1..amount).each do 
  $stdin.gets.chomp.split.map(&:to_i)
  get_digets(a[0] * a[1] + a[2])
end
