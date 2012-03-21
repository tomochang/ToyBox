require 'rubygems'
require 'open-uri'
require 'json'
require 'nokogiri'

url = "http://www.ted.com/talks/brene_brown_listening_to_shame.html"
doc = Nokogiri::HTML(open(url))

ted_id = doc.xpath("//div[@id='share_and_save']").first.attribute("data-id")

open("http://www.ted.com/talks/subtitles/id/#{ted_id}/lang/en") do |f|
  json = JSON.parse(f.read)
  json['captions'].each do |j|
    puts j['content']
  end
end
