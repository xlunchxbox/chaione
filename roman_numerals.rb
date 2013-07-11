def roman_numeral_convertor(n)
  #array of base values and weird values like 4 & 9
  base_numbers =   [1000, 900, 500, 400, 100,90, 50, 40, 10, 9, 5, 4, 1]
  
  #array of Roman Numerals
  roman_numerals = ["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"]
  converted_roman_numeral = ""
 
  #loop through and compare passed number to base_numbers
  base_numbers.length.times do |i|
    while n >= base_numbers[i]
      n = n - base_numbers[i]
      converted_roman_numeral = converted_roman_numeral + roman_numerals[i]
    end
  end
  converted_roman_numeral
end
 
 
(1..100).each do |n|
  puts "#{n} #{roman_numeral_convertor(n)}"
end