require 'open-uri'
require 'net/http'
require 'date'

def get_git_info (start, finish)
  github_info =  `curl -i' 'http://api.github.com/repos/rails/rails/commits?since=#{Time.now.year}-#{start}-01&until=#{Time.now.year}-#{finish}-01'`
  File.open("github.txt", "w"){|file| file.write(github_info)}
end


def parse_info(start, finish)
  names = Array.new
  counter = Hash.new(0)
  i=0

  File.open("github.txt").each do |line|
    if line.include?("name")
      names[i] = line.scan(/\"name": "(.*?)\"/)
      i = i + 1
    end
  end

  names.each{|i| counter[i]+=1}

  puts "Top 3 contributors for: #{Time.now.year}-#{start}-01 to #{Time.now.year}-#{finish}-01"
  puts Hash[counter.sort_by{|k, v| v}.reverse].take(3)
  
end

current_date = Time.now.month
puts current_date

# for i in 1..current_date - 1
#   puts "#{i}, #{i+1}"
# end

for i in 1..6
  get_git_info(i, i+1)
  parse_info(i, i+1)
end
