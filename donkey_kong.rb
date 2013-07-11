def donkey_kong
  (1..100).each do |n|
    
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
