#lookup call sign on free qrz account
require 'xmlsimple'
require 'net/http'

module GetQRZ

#  args = Hash[ 
#	:url => "http://xmldata.qrz.com/xml/current",
#	:agen => "mmg-1.0.1",
#
#	:user => "ei5hsb", 
#	:pass => "Letmein_123" ]

  def GetQRZ.login(args)
    url = "#{args[:url]}/?username=#{args[:user]};password=#{args[:pass]};agent=#{args[:agen]}"
    xml =  Net::HTTP.get_response(URI.parse(url)).body if url 
    content  = XmlSimple.xml_in( xml, { 'ForceArray' => false } )
    return content['Session']['Key']
  end

  def GetQRZ.callSignLookup(key, callsign,args)
    url = "#{args[:url]}/?s=#{key};callsign=#{callsign}"
    xml =  Net::HTTP.get_response(URI.parse(url)).body if url 
    content  = XmlSimple.xml_in( xml, { 'ForceArray' => false } )
  end
end
