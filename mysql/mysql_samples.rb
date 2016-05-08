require 'mysql'

puts 'test'

#Show server info
def get_info
  @con = Mysql.new( 'localhost', 'root', 'letmein')
  puts @con.get_server_info
end

#Show databases
def show_dbs
  @con = Mysql.new( 'localhost', 'root', 'letmein')
  @con.list_dbs.each do |x|
  puts x
  end
end 

show_dbs
