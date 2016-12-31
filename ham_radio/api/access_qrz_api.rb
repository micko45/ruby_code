#!/bin/env ruby
#Use qrz_api to connect to qz and get some info. 

require "./qrz_api.rb"
require 'optparse'
require './adif_api.rb'

#Create hash required by qrz api
args = Hash[
  :url  => "http://xmldata.qrz.com/xml/current",
  :agen => "mmg-1.0.1",
  :user => "ei5hsb",
  :pass => "Letmein_123" ]


def getHistory(file, tosearch)
  data = ADIF2Hash.hash(file)
  testarray = ADIF2Hash.searchArray('call', tosearch, data)
  return testarray.length
end

#sort and print output. 
def printout(query,history)
  puts "Callsign: #{query['Callsign']['call']}"
  puts "Name: #{query['Callsign']['fname']} #{query['Callsign']['name']}"
  puts "Address: #{query['Callsign']['addr2']}"
  puts "Country: #{query['Callsign']['country']}"
  puts "Previous Contacts: #{history}"
  
#  puts "Comment: Thks  #{query['Callsign']['fname']} for QSO, 73"
  puts "https://www.qrz.com/db/#{query['Callsign']['call']}"
end

#Get the options
options = {}
OptionParser.new do |opts|
  opts.banner = "Usage: example.rb [options]"

  opts.on("-v", "--[no-]verbose", "Run verbosely") do |v|
    options[:verbose] = v
  end
  opts.on("-c", "--callsign CALLSIGN") do |lib|
    options[:callsign] = lib
  end
end.parse!

###Main#####
history = getHistory('../test.adi', options[:callsign])
if options[:callsign].to_s != ''
    printout(GetQRZ.callSignLookup(GetQRZ.login(args), options[:callsign], args),history)
else
  print "call sign to lookup> "
  callsign = $stdin.gets.chomp
  if callsign == ""
    callsign = "ei5hsb"
  end
  printout(GetQRZ.callSignLookup(GetQRZ.login(args), callsign, args),history)
end
