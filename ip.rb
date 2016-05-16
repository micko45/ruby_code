require 'ipaddr'


ipaddr1 = IPAddr.new '10.10.10.10'
ipaddr2 =  '1000.10.10.10'
ipaddr3 = IPAddr.new '10.10.10.10/24'


if ipaddr1.ipv4?
  puts "yest"
else
  puts "no"
end

puts ipaddr3.mask(24)

network_prefix = ipaddr3.mask(24)
puts network_prefix



  
  
