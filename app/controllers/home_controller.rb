require 'net/https'
require 'uri'
require 'active_support/core_ext/hash/conversions'

class HomeController < ApplicationController
  
  def index
    @contact = Contact.new
  end
  
  def tenants
    @contact = Contact.new
    @inquiry = Enquiry.new
  end
  
  def community
    @contact = Contact.new
  end
  
  def mission
    @contact = Contact.new
  end
  
  def news
    @contact = Contact.new
    @tumblr_hash = get_tumblr_articles
    
    @articles = @tumblr_hash["tumblr"]["posts"]["post"] if @tumblr_hash != [] 
    @articles = modify_photo_posts(@articles)
    
  end
  
  def events
    @contact = Contact.new
    @events = get_otc_events["data"]
  end
  
  private
  
  def get_tumblr_articles
    uri = URI.parse("http://blog.techcu.be/api/read?start=0&num=5")
    http = Net::HTTP.new(uri.host, uri.port)
    response = http.request(Net::HTTP::Get.new(uri.request_uri))
    xml = Nokogiri::XML::Document.parse(response.body)
    tumblr_hash = Hash.from_xml(xml.to_s)
    return tumblr_hash
  end
  
  
  def get_otc_events
    uri = URI.parse("http://opentechcalendar.co.uk/index.php/location/1/json")
    http = Net::HTTP.new(uri.host, uri.port)
    response = http.request(Net::HTTP::Get.new(uri.request_uri))
    events = JSON.parse(response.body)
  end
  
  def modify_photo_posts(articles)
    articles.each do |article|
      if article["type"] == "photo"
        photos = []
        article["photoset"]["photo"].each do |image|
          photos << {"url" => image["photo_url"][1], "caption" => image["caption"] }
        end

        article["images"] = photos
      end
    end
  end
  
end
