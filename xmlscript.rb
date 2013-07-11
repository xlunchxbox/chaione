#!/usr/bin/ruby

require 'open-uri'

def save_xml
  open('appnet.xml', 'wb') do |file|
    file << open('https://alpha-api.app.net/feed/rss/users/136/posts').read
  end
end

save_xml