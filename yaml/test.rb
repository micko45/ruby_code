require 'yaml'

@thing = YAML.load_file('vf.yaml')
#puts @thing.inspect 
#So with yaml deeply imbeded its trick to get out hte info with out horrible code
def get_net_rdp(host)
  if @thing[:hosts][host].has_key?('interfaces')
    @thing[:hosts][host]['interfaces'][0].each {|y, x| puts "#{y} => #{x} "}
    puts
  end
end

def get_net_prod(host)
  if @thing[:hosts][host].has_key?('interfaces')
    @thing[:hosts][host]['interfaces'][1].each {|y, x| puts "#{y} => #{x} "}
    puts
  end
end

def get_host_gateway(host)
  if @thing[:hosts][host].has_key?('defaultgw')
    return  @thing[:hosts][host]['defaultgw'].to_s
  end
end

def list_new_hosts
   a = Array.new
   @thing[:hosts].each do |key, hash| 
      a.push(key)
    end
    return a
end

#a = list_new_hosts
#puts a
#get_net_rdp(server01')
#get_net_prod
a = list_new_hosts
a.each do | host | 
   puts "host => #{host}"
   puts "Gateway =>  #{get_host_gateway(host)}"
   get_net_rdp(host)
   get_net_prod(host)
   puts
end
#get_host_gateway(server01)
