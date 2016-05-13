#create hash from array
=begin
The splat operator (that is, the *) turns what would otherwise be an array into a list for assignment within the hash.
=end

def hash_from_array1
  a1 = [ 'apple', 1, 'bannan', 2 ]
  h1 = Hash[*a1.flatten(1)]
  puts h1.inspect

  a2 = [[ 'apple', 1], ['bannan', 2 ]]
  h2 = Hash[*a2.flatten(1)]
  puts h2.inspect

  a3 = [ 'apple', 1, 'bannan', 2 ]
  h3 = Hash[*a3]
  puts h3.inspect
  

end

def hash_from_array2
  a4 = [ :host, ['server1', ['defaultgw', '192.152.22.1' ]]]
  h4 = Hash[*a4]
  puts h4.inspect
end
hash_from_array2
