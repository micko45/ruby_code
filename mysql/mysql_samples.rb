require 'mysql'

def get_pass
 File.open('/tmp/pass').each do | lines |
   return lines.to_s.chomp
 end
end


@defaults = {
    :user => 'root',
    :pass => get_pass,
    :db   => 'bbc_schedule',
    :host => 'localhost'
}

#Show server info
def get_info
  con = Mysql.new( @defaults[:host], @defaults[:user], @defaults[:pass])
  puts con.get_server_info
end

#Show databases
def show_dbs
  con = Mysql.new( @defaults[:host], @defaults[:user], @defaults[:pass])
  con.list_dbs.each do |x|
  puts x
  end
end 

#Get rows and print
def get_rows_and_print(query)
#  query = "select * from schedule limit 5"
  con = Mysql.new( @defaults[:host], @defaults[:user], @defaults[:pass], @defaults[:db])
  con.query(query).each do |q|
    puts "#{q}"
  end
end

#Get rows and retrun array 
def get_rows_and_array(query)
  con = Mysql.new( @defaults[:host], @defaults[:user], @defaults[:pass], @defaults[:db])
#Q is a Mysql::Result object not an array or a hast or String
#you have to do .each to iterate through it. 
  q = con.query(query)
  return q
end

get_rows_and_print("select * from schedule limit 10")
