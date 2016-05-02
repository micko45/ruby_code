=begin
function that combines two lists by 
alternatingly taking elements, e.g. 
[a,b,c], [1,2,3] → [a,1,b,2,c,3].
=end 

def mix_lists(a, b)
  i = 0
  final = Array.new(a.size + b.size)
  a.each do | x |
    final[i] = x
    i += 2
  end 
  i = 1
  b.each do | x |
    final[i] = x
    i += 2
  end 

  return final 
end

a =  %w(one two three four five size seven)
b =  %w(1 2 3 4 5 6 7)

puts  mix_lists(a, b)
