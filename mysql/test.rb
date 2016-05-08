require 'mysql'

puts 'test'

@con = Mysql.new( 'localhost', 'root', 'letmein')
puts @con.get_server_info
q = @con.query('show databases')
#puts q.fetch_row
@con.list_dbs.each do |x|
  puts x
end
