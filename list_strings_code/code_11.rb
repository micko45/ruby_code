#function that merges two sorted lists into a new list.

def concat_lists(a, b)
  final = Array.new
  a.each {|x| final.push(x)}
  b.each {|x| final.push(x)}
  return final.sort
end

a =  %w(1 2 4)
b =  %w(3 5 8)

puts  concat_lists(a.sort, b.sort)
