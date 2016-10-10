#!/usr/bin/env ruby

module CwLookup
#Countries lookup 
  countries  = {'ei' => 'Ireland','k' => 'USA', 'd' => 'Germany' }

  def CwLookup._splitCallSign(callSign)
    String vari = ""
    callSign.split("").each do |i|
      if i !~ /[0-9]/
        vari = "#{vari}" + i
      else 
        return vari.to_s
      end
    end
    return vari.to_s
  end

  def CwLookup._getCountryID(countryCode, countries)
    if countries.has_key?(countryCode)
      return "#{countryCode}, #{countries[countryCode]}"
    else 
      return "not found it, #{countryCode}"
    end
    return
  end
    
  print "call sign to lookup> "
  choice = gets.chomp
  #choice = $stdin.gets.chomp
  puts CwLookup._getCountryID(CwLookup._splitCallSign(choice),countries)

end
