class Contact < ActiveRecord::Base
  
  WEBSITE_LISTS = {
    :services => "4ba196bdab",
    :students => "9914162b13",
    :freelancers => "fb04a6021e",
    :investors => "a026764a53",
    :startups => "c71b6dcd1d",
    :all => "90b2e3c284",
    :test => "3b96e43454"
  }
  
  
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  attr_accessible :email, :iama, :name
  

  
  validates :name, :presence => { :message => "can't be blank" },
                     :length => { :maximum => 50, :message => "is too long"}
                     
                     
  validates :email, :presence => { :message => "can't be blank"},
                     :format => { :with => email_regex, :message => "is the incorrect format"},
                     :uniqueness => {:case_sensitive => false, :message => "has already signed up"}
end
