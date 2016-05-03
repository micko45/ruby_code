=begin
Prints the first 100 fibinace seqences
=end

a = [0, 1 ]

100.times { a.push(a[-1] + a[-2])}
puts a
