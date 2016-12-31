require './adif_api.rb'

if ARGV.length ==  2
  tosearch = ARGV[1]
end 

def itierateArray(data)
  data.each do |x| 
    searchHash(x, 'call', tosearch)
    #itierateHash(x)
  end
end

def itierateHash(hashdata)
    hashdata.each do |k, v|
      puts "#{k} #{v}"
    end
end

data = ADIF2Hash.hash(ARGV[0])
testarray = ADIF2Hash.searchArray('call', tosearch, data) 
puts testarray.length
