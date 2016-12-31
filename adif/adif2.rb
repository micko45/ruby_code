adif_file = File.open(ARGV[0], "r").read
reports = adif_file.split("<EOR>")
reports.pop

reports.each do |r|
 puts "#{r}"
end


