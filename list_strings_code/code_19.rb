puts "Lets convert a phrase,"
puts "please imput some text"
a = $stdin.gets.chomp.split(" ")

#puts a.inspect

a.each do |word|
  a2 = word.split("")
  a2.push(a2[0])
  a2.shift
  string = a2.to_s
  print "#{string}"
end
