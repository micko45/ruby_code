require 'csv'
require 'yaml'

$f_in = './server.csv'
$f_out = './server.yaml'

def print_csv
  data = CSV.read($f_in)
  puts data.inspect
end

def print_csv_each
  CSV.foreach($f_in) do |row|
    puts row.inspect
  end
end


def print_csv_test
  CSV.foreach('./server.csv', :header => true) { |row| p row }
end

def alt_1
  csv = CSV.new('./server.csv', :header => true)
  puts csv.to_a.inspect
end

def alt_2
  csv = CSV.new($f_in, :headers => true, :header_converters => :symbol, :converters => :all)
  csv.to_a.map {|row| row.to_hash }
end 
alt_2

#File.open(f_out, 'w') { |f| f.write(data.to_yaml) }


