require 'csv'

@in_file = ARGV[0]

#Return an array of hashs from a csv file
def array_of_hashes(file)
  csv = CSV.read(file)
  headers = csv.shift.map {|i| i.to_s }
  s_data = csv.map {|row| row.map {|cell| cell.to_s } }
  array_of_hashes = s_data.map {|row| Hash[*headers.zip(row).flatten] }
end
puts array_of_hashes(@in_file).inspect

=begin
Sample input data
SYS_NAME,RDP_IP,RDP_MAC,PRD_IP,PRD_DOMAIN,PRD_NETMASK,PRD_GATEWAY,PRD_MAC,LDAP,BACKUP,ORACLE,GSP
votstfzr,10.173.6.48,00:50:56:93:43:b0,10.97.102.249,dc-ratingen.de,255.255.252.0,10.97.102.1,00:50:56:93:43:b2,YES,NO,NO,NO
vo024avr,10.97.128.132,00:50:56:95:25:5b,145.230.207.192,admnet.vodafone.com,255.255.255.192,10.97.128.1,00:50:56:95:25:5c,YES,NO,NO,NO
votstjvr,10.78.177.36,00:50:56:ad:24:8b,none,admnet.vodafone.com,none,10.78.177.1,none,YES,NO,NO,NO
l5uxde35,172.24.66.114,00:50:56:bf:12:2b,none,oskarmobil.cz,172.24.66.1,172.24.66.114,none,YES,NO,NO,NO

Returns
[{"SYS_NAME"=>"votstfzr", "RDP_IP"=>"10.173.6.48", "RDP_MAC"=>"00:50:56:93:43:b0", "PRD_IP"=>"10.97.102.249", "PRD_DOMAIN"=>"dc-ratingen.de", "PRD_NETMASK"=>"255.255.252.0", "PRD_GATEWAY"=>"10.97.102.1", "PRD_MAC"=>"00:50:56:93:43:b2", "LDAP"=>"YES", "BACKUP"=>"NO", "ORACLE"=>"NO", "GSP"=>"NO"}, {"SYS_NAME"=>"vo024avr", "RDP_IP"=>"10.97.128.132", "RDP_MAC"=>"00:50:56:95:25:5b", "PRD_IP"=>"145.230.207.192", "PRD_DOMAIN"=>"admnet.vodafone.com", "PRD_NETMASK"=>"255.255.255.192", "PRD_GATEWAY"=>"10.97.128.1", "PRD_MAC"=>"00:50:56:95:25:5c", "LDAP"=>"YES", "BACKUP"=>"NO", "ORACLE"=>"NO", "GSP"=>"NO"}, {"SYS_NAME"=>"votstjvr", "RDP_IP"=>"10.78.177.36", "RDP_MAC"=>"00:50:56:ad:24:8b", "PRD_IP"=>"none", "PRD_DOMAIN"=>"admnet.vodafone.com", "PRD_NETMASK"=>"none", "PRD_GATEWAY"=>"10.78.177.1", "PRD_MAC"=>"none", "LDAP"=>"YES", "BACKUP"=>"NO", "ORACLE"=>"NO", "GSP"=>"NO"}, {"SYS_NAME"=>"l5uxde35", "RDP_IP"=>"172.24.66.114", "RDP_MAC"=>"00:50:56:bf:12:2b", "PRD_IP"=>"none", "PRD_DOMAIN"=>"oskarmobil.cz", "PRD_NETMASK"=>"172.24.66.1", "PRD_GATEWAY"=>"172.24.66.114", "PRD_MAC"=>"none", "LDAP"=>"YES", "BACKUP"=>"NO", "ORACLE"=>"NO", "GSP"=>"NO"}]
=end
