
@doors = Array.new
$count = 0

def create_doors
  (0..99).each do |x|
    @doors[x] = "closed"
  end
  return @doors
end

def open_or_shut(door)
  if door == 'open'
    return 'shut'
  else 
    return 'open'
  end
end

def go(value)
  while $count < 100
    y  = open_or_shut(@doors[$count])
    @doors[$count] = y
    $count += value.to_i
  end
end

bahh = 0
create_doors

(1..99).each do |x|
  puts go(x)
end
puts @doors.inspect
