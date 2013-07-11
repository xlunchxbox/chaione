

def roman_numeral_convertor(n)
  base_numbers =   [1000, 900, 500, 400, 100,90, 50, 40, 10, 9, 5, 4, 1]
  roman_numerals = ["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"]
  roman_numeral = ""
  i = 0
 
  base_numbers.length.times do |i|
    while n >= base_numbers[i]
      n = n - base_numbers[i]
      roman_numeral = roman_numeral + roman_numerals[i]
    end
  end
  roman_numeral
end
 
 
(1..100).each do |n|
  puts "#{n} #{roman_numeral_convertor(n)}"
end