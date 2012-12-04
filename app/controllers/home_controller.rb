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
  end
  
  private
  
  def get_tumblr_articles
    uri = URI.parse("http://techcube-ed.tumblr.com/api/read")
    http = Net::HTTP.new(uri.host, uri.port)
    response = http.request(Net::HTTP::Get.new(uri.request_uri))
    xml = Nokogiri::XML::Document.parse(response.body)
    tumblr_hash = Hash.from_xml(xml.to_s)
    return tumblr_hash
  end
  
end
