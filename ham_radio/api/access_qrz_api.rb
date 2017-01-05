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

#Get  options
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

#lookup previous QSO
def cntCallHis(data, tosearch)
  testarray = ADIF2Hash.searchArray('call', tosearch, data)
  return testarray.length
end

#Count the qso per country. 
def cntCtrylHis(data, tosearch)
  testarray = ADIF2Hash.searchArray('country', tosearch, data)
  return testarray.length
end

#sort and print output. 
def printout(qrzInfo,history)
  puts "Callsign: #{qrzInfo['Callsign']['call']}"
  puts "Name: #{qrzInfo['Callsign']['fname']} #{qrzInfo['Callsign']['name']}"
  puts "Address: #{qrzInfo['Callsign']['addr2']}"
  puts "Country: #{qrzInfo['Callsign']['country']}"
  puts "Previous Contacts: #{history[:callcount]}"
  puts "Previous Country: #{history[:ctrycount]}"
  puts "https://www.qrz.com/db/#{qrzInfo['Callsign']['call']}"
end

###########'
#Main    #
###########'

#Create hash for adif file
adifFile = '/mediashare/medishare/current_Log.ADI'
adifData = ADIF2Hash.hash(adifFile)

#Check if call sign is a option
if options[:callsign].to_s != ''
    qrzInfo = GetQRZ.callSignLookup(GetQRZ.login(args), options[:callsign], args)
else
  print "call sign to lookup> "
  callsign = $stdin.gets.chomp
  if callsign == ""
    callsign = "ei5hsb"
    qrzInfo = GetQRZ.callSignLookup(GetQRZ.login(args), callsign, args)
  end
end

#Get call sign QSO history
history = { :callcount => cntCallHis(adifData, qrzInfo['Callsign']['call']),
            :ctrycount => cntCtrylHis(adifData, qrzInfo['Callsign']['country']) }
  printout(qrzInfo, history)

