require 'iconv'
class Post < ActiveRecord::Base
  attr_accessible :title, :body, :to_url, :user_id
  belongs_to :user
  # attr_accessible :title, :body
  
  validates :title, :presence => true
  validates :body, :presence => true
  
  def to_url
    
    converted= Iconv.iconv('ascii//ignore//translit', 'utf-8', title.downcase).to_s
    string = converted.gsub(/[^A-Za-z0-9\s]/, "").gsub(/\s+/, "-").to_s.chomp("-")
    return "#{self.id}-#{string}"
  end
  
end
