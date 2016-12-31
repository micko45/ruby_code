module  ADIF2Hash
  def ADIF2Hash.hash(file)
    adif_file = File.open(file, "r").read
    body = adif_file.split("<EOH>")[1]
    record = body.split("<EOR>")

    data = Array.new
    record.each do |r|
      rep_hash = {}
      elements = r.split("<")
      elements.shift
  
      elements.each do |e|
        k,v = e.split(">")
        k = k.split(":")[0]
        rep_hash[k] = v.nil? ? '' : v.gsub("'", "''")
      end
      data.push(rep_hash)
    end

    return data
  end

  def ADIF2Hash.searchArray(recordname, tosearch, data)
    found = Array.new
    data.each do |x|
      returned = ADIF2Hash.searchHash(x, recordname, tosearch)
      if returned.is_a?(Hash)
        found.push(returned)
      end
    end
    return found
  end

  def ADIF2Hash.searchHash(h, k, search)
     if h[k].to_s.strip == search
       return h
     else
       return 0
     end
  end
end
