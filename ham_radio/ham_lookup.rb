#!/usr/bin/env ruby

module CwLookup
#Countries lookup table
  countries  = {'ei' => 'Ireland','k' => 'USA', 'd' => 'Germany' }

  def CwLookup._splitCallSign(callSign)
    ctry = Hash[ 'code' => "",  'num' => "", 'id' => "" ]
    lockcode, locknum  = 0
    callSign.split("").each do |i|
      if i !~ /[0-9]/ and  lockcode == 0
        ctry['code'] = ("#{ctry['code']}" + i).to_s
      elsif i =~ /[0-9]/ || locknum == 0
        ctry['num'] = "#{ctry['num']}" + i
        #so we got the country code so we lock it out
        #we need to now split out hte number. 
        lockcode = 1
      else 
         #So we got the num and we lock it out. 
         ctry['id'] = "#{ctry['id']}" + i
         locknum = 1
      end
    end
        return ctry
  end

  def CwLookup._getCountryID(countryCode, countries)
    array = Array.new
    if countries.has_key?(countryCode)
      array.push(countryCode, countries[countryCode])
      return array
    else 
      return #"not found it, #{countryCode}"
    end
    return
  end
    
  print "call sign to lookup> "
  choice = $stdin.gets.chomp

  callSignHash = Hash[CwLookup._splitCallSign(choice)]
  data = CwLookup._getCountryID(callSignHash['code'], countries)
  data.push callSignHash['num']
  data.push(callSignHash['id'])
  print data
puts

end
