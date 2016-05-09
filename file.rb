#open are pring 
def open_print(file)
   f = File.open(file) 
   puts f.read
end


#when more convenient to read the file line by line. 
def open_readlines(file)
 File.open(file).readlines.each do | lines |
   puts lines
 end
end     

#Retrun line as a string.
def return_firstline(file)
 File.open(file).readlines.each do | lines |
   return lines.to_s
 end
end     

a = return_firstline('/tmp/pass')  
puts a
   
  

#open_print
#open_readlines('/tmp/pass')
