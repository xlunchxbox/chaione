require 'open-uri'
require 'rubygems'
require 'hpricot'

def save_xml
  open('appnet.txt', 'wb') do |file|
    file << open('https://alpha.app.net/browse/conversations/').read
  end
end


doc = open("https://alpha.app.net/browse/conversations/") { |f| Hpricot(f) }


user_name = ""
post = ""
# (doc/"[@class='stream-container']").each do |i|
#   puts "=================================================================="
#   user_name = "Username \n #{doc.at("//[@class='post-header']//[@class='username']//a")}" 
#   user_name =  user_name.scan(/\>(.*?)\</)
#   puts user_name
#   
#   post =  "Post Content \n #{ doc.at("//[@class='post-content']//span")}"
#   post = post.scan(/\>(.*?)\</)
#   puts post
#   puts "=================================================================="
# end

user_names = doc.search("//[@class='post-header']//[@class='username']//a")
posts = doc.search("//[@class='post-content']//span")

test = ""
for i in 0..user_names.size - 1
  puts "=================================================================="
  user_name = user_names[i].to_html
  user_name =  user_name.scan(/\>(.*?)\</)
  puts user_name
  
  post = posts[i].to_html
  post = post.scan(/\>(.*?)\</)
  puts post
  puts "=================================================================="
  test = gets
  test = test.chomp
end