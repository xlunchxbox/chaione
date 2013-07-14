require 'open-uri'
require 'rubygems'
require 'hpricot'

def grab_feed
  #grab feed at link and store it in doc
  doc = open("https://alpha.app.net/browse/conversations/") { |f| Hpricot(f) }
  doc
end

def process_feed(doc)
  #to hold user_name and password for regex processing
  user_name = ""
  post = ""

  #search document and store usernames and posts
  user_names = doc.search("//[@class='post-header']//[@class='username']//a")
  posts = doc.search("//[@class='post-content']//span")
  display_feed(posts, user_names)
end

def display_feed (posts, user_names)
  #loop through user_names and posts arrays to format the usernames and posts
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
end


doc = grab_feed
process_feed (doc)

