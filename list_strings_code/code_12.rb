=begin
function that rotates a list by k elements. 
For example [1,2,3,4,5,6] rotated by two 
becomes [3,4,5,6,1,2]. Try solving this without 
creating a copy of the list. 
How many swap or move operations do you need?
=end

def rotate_list(a, k)
  i = 0
  while i < k 
    a.push(a[0]) 
    a.shift
    i += 1
  end
  return a
end

a =  %w(1 2 3 4 5 6 7 8 9)
puts  rotate_list(a, 6)
