require 'open-uri'
require 'rubygems'
require 'hpricot'

#grab feed at link and store it in doc
doc = open("https://alpha.app.net/browse/conversations/") { |f| Hpricot(f) }

#to hold user_name and password for regex processing
user_name = ""
post = ""

#search document and store usernames and posts
user_names = doc.search("//[@class='post-header']//[@class='username']//a")
posts = doc.search("//[@class='post-content']//span")


#loop through user_names and posts array to format the usernames and posts
#use regex to only grab text contained within > <
for i in 0..user_names.size - 1
  puts "=================================================================="
  user_name = user_names[i].to_html
  user_name =  user_name.scan(/\>(.*?)\</)
  puts user_name
  
  post = posts[i].to_html
  post = post.scan(/\>(.*?)\</)
  puts post
  puts "=================================================================="
end