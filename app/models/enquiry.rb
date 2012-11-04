class Enquiry < ActiveRecord::Base
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
  attr_accessible :company, :email, :employees, :name, :phone, :pitch, :movein_date
  # 
  # validates :company, :presence => { :message => "can't be blank" },
  #                    :length => { :maximum => 50, :message => "is too long"}
  #                    
  #                    
  # validates :email, :presence => { :message => "can't be blank"},
  #                    :format => { :with => email_regex, :message => "is the incorrect format"},
  #                    :uniqueness => {:case_sensitive => false, :message => "has already signed up"}
end
