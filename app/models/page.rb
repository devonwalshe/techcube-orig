class Page < ActiveRecord::Base
  attr_accessible :url, :body, :title
  
  # attr_accessible :title, :body
end
