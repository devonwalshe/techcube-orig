require 'net/https'
require 'uri'
require 'active_support/core_ext/hash/conversions'

class HomeController < ApplicationController
  
  def index
    @contact = Contact.new
  end
  
  def news
    @contact = Contact.new
    @tumblr_hash = get_tumblr_articles("http://blog.techcu.be/api/read?start=0&num=5")
    
    @articles = @tumblr_hash["tumblr"]["posts"]["post"] if @tumblr_hash != [] 
    @articles = modify_photo_posts(@articles)
    
  end
  
  def surf
    @tumblr_hash = get_tumblr_articles("http://techcubesurfclub.tumblr.com/api/read?start=0&num=5")
    @articles = @tumblr_hash["tumblr"]["posts"]["post"] if @tumblr_hash != []
    # debugger
    @articles = modify_photo_posts(@articles)
  end
  
  def events
    @contact = Contact.new
    @event = Event.new
    @unapproved_events = Event.where(:approved => false)
    @approved_events = Event.where(:approved => true)
    @otc_events = get_otc_events["data"]
    
  end
  
  def jobs
    @contact = Contact.new
    @job = Job.new
  end
  
  private
  
  def get_tumblr_articles(url)
    uri = URI.parse(url)
    http = Net::HTTP.new(uri.host, uri.port)
    response = http.request(Net::HTTP::Get.new(uri.request_uri))
    xml = Nokogiri::XML::Document.parse(response.body)
    tumblr_hash = Hash.from_xml(xml.to_s)
    return tumblr_hash
  end
  
  

  
  def modify_photo_posts(articles)
    articles.each do |article|
      if article["type"] == "photo"
        photos = []
        if article["photoset"] != nil
          article["photoset"]["photo"].each do |image|
            photos << {"url" => image["photo_url"][1], "caption" => image["caption"] }
          end  
        else
          photos << { "url" => article["photo_url"][1], "caption" => article["caption"]}
        end
        article["images"] = photos
      end
    end
  end
  
end
