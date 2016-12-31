#!/bin/env ruby

#lookup call sigon on free qrz account
require 'xmlsimple'
require 'cgi'
require 'net/http'
require 'optparse'

args = Hash[ 
	:url => "http://xmldata.qrz.com/xml/current",
	:agen => "mmg-1.0.1",
	:user => "ei5hsb", 
	:pass => "Letmein_123" ]

def login(args)
  url = "#{args[:url]}/?username=#{args[:user]};password=#{args[:pass]};agent=#{args[:agen]}"
  xml =  Net::HTTP.get_response(URI.parse(url)).body if url 
  content  = XmlSimple.xml_in( xml, { 'ForceArray' => false } )
  return content['Session']['Key']
end

def callSignLookup(key, callsign,args)
  url = "#{args[:url]}/?s=#{key};callsign=#{callsign}"
  xml =  Net::HTTP.get_response(URI.parse(url)).body if url 
  content  = XmlSimple.xml_in( xml, { 'ForceArray' => false } )
end

def printout(query)
  puts "Callsign: #{query['Callsign']['call']}"
  puts "Name: #{query['Callsign']['fname']} #{query['Callsign']['name']}"
  puts "Address: #{query['Callsign']['addr2']}"
  puts "Country: #{query['Callsign']['country']}"
  puts "Comment: Thks  #{query['Callsign']['fname']} for QSO, 73"
  puts "https://www.qrz.com/db/#{query['Callsign']['call']}"
end

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

############################################

if options[:callsign].to_s != ''
    printout(callSignLookup(login(args), options[:callsign], args)) 
else
  print "call sign to lookup> "
  callsign = $stdin.gets.chomp
  if callsign == ""
    callsign = "ei5hsb"
  end
printout(callSignLookup(login(args), callsign, args))
end
