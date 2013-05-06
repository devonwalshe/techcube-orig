require 'iconv'

class Job < ActiveRecord::Base
  attr_accessible :approved, :company_description, :company_name, :how_to, :job_description, :job_title, :location, :person_description, :postcode, :salary, :user_email, :user_name, :start_date, :live_date, :expiry_date, :hours_per_week

  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  postcode_regex = /^\s*((GIR\s*0AA)|((([A-PR-UWYZ][0-9]{1,2})|(([A-PR-UWYZ][A-HK-Y][0-9]{1,2})|(([A-PR-UWYZ][0-9][A-HJKSTUW])|([A-PR-UWYZ][A-HK-Y][0-9][ABEHMNPRVWXY]))))\s*[0-9][ABD-HJLNP-UW-Z]{2}))\s*$/i

  validates :company_description, :presence => { :message => "can't be blank" },
                     :length => { :maximum => 50, :message => "is too long"}
                     
  validates :company_name, :presence => { :message => "can't be blank" },
                   :length => { :maximum => 200, :message => "is too long"}
  
  validates :how_to, :presence => { :message => "can't be blank" },
                   :length => { :maximum => 200, :message => "is too long"}
  
  validates :job_description, :presence => { :message => "can't be blank" },
                   :length => { :maximum => 600, :message => "is too long"}
  
  validates :location, :presence => { :message => "can't be blank" },
                   :length => { :maximum => 200, :message => "is too long"}

  validates :postcode, :presence => { :message => "can't be blank" },
                   :format => { :with => postcode_regex, :message => "is the incorrect format"},
                   :length => { :maximum => 200, :message => "is too long"}
  
  validates :salary, :presence => { :message => "can't be blank" }
  
  validates :user_name, :presence => { :message => "can't be blank\n" },
                   :length => { :maximum => 80, :message => "is too long"}
  
  validates :user_email, :presence => { :message => "can't be blank"},
                     :format => { :with => email_regex, :message => "is the incorrect format"}
  
  ## TODO - add validations for live, expiry, salary, hours 
   
   def to_url

     converted = Iconv.iconv('ascii//ignore//translit', 'utf-8', job_title.downcase).to_s
     string = converted.gsub(/[^A-Za-z0-9\s]/, "").gsub(/\s+/, "-").to_s.chomp("-")
     return "#{self.id}-#{string}"
   end

  private
  


end
