def donkey_kong
  #loop through from 1 to 100
  (1..100).each do |n|
    
    #Check to see if both divisble by 3 & 5 first, then just 3, then 5, if none
    #then print the number
    if (n % 3 == 0) && (n % 5 == 0)
      print "#{n} Donkey Kong\n"
      
    elsif n % 3 == 0
      print "#{n} Donkey \n"
    
    elsif n % 5 == 0 
      print "#{n} Kong \n"
    else
      print "#{n} \n"
    end
  end
end

donkey_kong
