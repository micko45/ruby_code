#function that concatenates two lists

def concat_lists(a, b)
  final = Array.new
  a.each {|x| final.push(x)}
  b.each {|x| final.push(x)}
  return final 
end

a =  %w(one two three)
b =  %w(four five  six)

puts  concat_lists(a, b)
