require 'apipie-bindings'


defaults = { 
  :user => 'micko', 
  :pass => 'letmein', 
  :url  => 'http://foreman.example.com:5432'
}

@api = ApipieBindings::API.new({:uri => defaults[:url], :username => defaults[:pass], :password => defaults[:pass]})


puts @api.resources
