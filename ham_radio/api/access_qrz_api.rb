#!/bin/env ruby
#Use qrz_api to connect to qz and get some info. 
require "./qrz_api.rb"
require 'optparse'
require './adif_api.rb'

##############
#SetUP
##############

#Create hash required by qrz api
args = Hash[
  :url  => "http://xmldata.qrz.com/xml/current",
  :agen => "mmg-1.0.1",
  :user => "ei5hsb",
  :pass => "Letmein_123" ]

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

##################
#functions
##################

def getCallHistory(file, tosearch)
  data = ADIF2Hash.hash(file)
  testarray = ADIF2Hash.searchArray('call', tosearch, data)
  return testarray.length
end

#sort and print output. 
def printout(qrzInfo,history)
  puts "Callsign: #{qrzInfo['Callsign']['call']}"
  puts "Name: #{qrzInfo['Callsign']['fname']} #{qrzInfo['Callsign']['name']}"
  puts "Address: #{qrzInfo['Callsign']['addr2']}"
  puts "Country: #{qrzInfo['Callsign']['country']}"
  puts "Previous Contacts: #{history[:call]}"
  puts "https://www.qrz.com/db/#{qrzInfo['Callsign']['call']}"
end

###########'
#Main    #
###########'
qrzInfo = GetQRZ.callSignLookup(GetQRZ.login(args), options[:callsign], args)
historyFile = '/mediashare/medishare/current_Log.ADI'
history = Hash.new
history[:call] = getCallHistory(historyFile, options[:callsign])

if options[:callsign].to_s != ''
    printout(qrzInfo, history)
else
  print "call sign to lookup> "
  callsign = $stdin.gets.chomp
  if callsign == ""
    callsign = "ei5hsb"
  end
  printout(qrzInfo, history)
end
