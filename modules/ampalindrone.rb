module Ampalindrone
  def Ampalindrone.checkit(s)
    testit = s.gsub(/\s+/, "").downcase
    if testit  == testit.reverse
      puts "yes \"#{s} \" is a palindrone"
    else
      puts "no \"#{s} \" is not a palindrone"
    end
  end
end
