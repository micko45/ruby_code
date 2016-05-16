#!/usr/bin/env ruby
require 'csv'
require 'yaml'

@in_file = ARGV[0]
@out_file = "#{@in_file}.yaml"

if ARGV[1]
  @host_2_check = ARGV[1]
end

def check_file(file)
  if !file
    puts "Erorr: no file Selected"
    exit 1
  end
end

#Return an array of hashs from a csv file
def array_of_hashes(file)
  check_file(file)
  csv = CSV.read(file)
  headers = csv.shift.map {|i| i.to_s }
  s_data = csv.map {|row| row.map {|cell| cell.to_s } }
  array_of_hashes = s_data.map {|row| Hash[*headers.zip(row).flatten] }
end

#create hash for net interface
def net_interface(host, mac, ip, id,  mask)
 if mask == ''
    h = { 'network_if_static' => { id => {
      'ensure'     => 'up',
      'macaddress' => mac,
      'ipaddress'  => ip,
      'hostname'   => host,
    }}}
  else
    h = { 'network_if_static' => { id => {
      'ensure'     => 'up',
      'macaddress' => mac,
      'ipaddress'  => ip,
      'hostname'   => host,
      'netmask'    => mask
    }}}

  end
end

#Create hash for single host
def create_host_hash(h)
    puts h.inspect
    tmp_host_data = {
     'domain'    => h['PRD_DOMAIN'],
     'classes'   => %w[ ldap  ],
     'defaultgw' => h['PRD_GATEWAY'],
   }
   if h['PRD_IP'] == "none"
     tmp_host_data['interfaces'] = net_interface(h['SYS_NAME'], h['RDP_MAC'], h['RDP_IP'], 'eth0', "")
     #tmp_host_data['interfaces'] = net_interface(h['SYS_NAME'], h['RDP_MAC'], h['RDP_IP'], 'eth0', "")

   else
     tmp_host_data['interfaces'] = [
       net_interface(h['SYS_NAME'], h['RDP_MAC'], h['RDP_IP'], 'eth0', ""),
       net_interface(h['SYS_NAME'], h['PRD_MAC'], h['PRD_IP'], 'eth1', h['PRD_NETMASK'])
     ]
   end
   return tmp_host_data
end

#Create final hash for all hosts
def get_hostinfo(file)
  data = Hash.new
  a = array_of_hashes(file)
  a.each do |line|
    data[line['SYS_NAME']] = create_host_hash(line)
    end
  return  data
end

#Create final hash for  single hosts
def get_hostinfo_single(file, server)
  data = Hash.new
  a = array_of_hashes(file)
puts server
  a.each do |line|
    if line['SYS_NAME'] == server
      data[line['SYS_NAME']] = create_host_hash(line)
      return  data
      end
    end
  return  data
end

#Write the yaml to out file,
def create_yaml
  if  @host_2_check and @host_2_check.is_a?(String)
    @host_data = { :hosts =>  get_hostinfo_single(@in_file, @host_2_check )}
  else
    @host_data = { :hosts =>  get_hostinfo(@in_file) }
  end
  #puts @host_data.inspect
  puts "creating #{@out_file}"
  File.open(@out_file, 'w') { |f| f.write(@host_data.to_yaml) }
end

create_yaml

=begin
Sample from Cable sheet output
SYS_NAME,RDP_IP,RDP_MAC,PRD_IP,PRD_DOMAIN,PRD_NETMASK,PRD_GATEWAY,PRD_MAC,LDAP,BACKUP,ORACLE,GSP
deossvvr,10.179.7.50,00:50:56:93:44:89,10.97.109.35,dc-ratingen.de,10.97.109.0/24,10.97.109.1,00:50:56:93:1d:e1,YES,YES,NO,NO

Sample input data from OCoE csv file
SYS_NAME,RDP_IP,RDP_MAC,PRD_IP,PRD_DOMAIN,PRD_NETMASK,PRD_GATEWAY,PRD_MAC,LDAP,BACKUP,ORACLE,GSP
votstfzr,10.173.6.48,00:50:56:93:43:b0,10.97.102.249,dc-ratingen.de,255.255.252.0,10.97.102.1,00:50:56:93:43:b2,YES,NO,NO,NO
vo024avr,10.97.128.132,00:50:56:95:25:5b,145.230.207.192,admnet.vodafone.com,255.255.255.192,10.97.128.1,00:50:56:95:25:5c,YES,NO,NO,NO
votstjvr,10.78.177.36,00:50:56:ad:24:8b,none,admnet.vodafone.com,none,10.78.177.1,none,YES,NO,NO,NO
l5uxde35,172.24.66.114,00:50:56:bf:12:2b,none,oskarmobil.cz,172.24.66.1,172.24.66.114,none,YES,NO,NO,NO
=end
