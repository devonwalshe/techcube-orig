class Event < ActiveRecord::Base
  attr_accessible :end_time, :event_description, :event_summary, :event_title, :location, :postcode, :start_time, :approved, :organiser_name, :organiser_email
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  postcode_regex = /^\s*((GIR\s*0AA)|((([A-PR-UWYZ][0-9]{1,2})|(([A-PR-UWYZ][A-HK-Y][0-9]{1,2})|(([A-PR-UWYZ][0-9][A-HJKSTUW])|([A-PR-UWYZ][A-HK-Y][0-9][ABEHMNPRVWXY]))))\s*[0-9][ABD-HJLNP-UW-Z]{2}))\s*$/i

  validates :event_title, :presence => { :message => "can't be blank" },
                     :length => { :maximum => 50, :message => "is too long"}
                     
  validates :location, :presence => { :message => "can't be blank" },
                   :length => { :maximum => 200, :message => "is too long"}
  
  validates :event_summary, :presence => { :message => "can't be blank" },
                   :length => { :maximum => 200, :message => "is too long"}
  
  validates :event_description, :presence => { :message => "can't be blank" },
                   :length => { :maximum => 600, :message => "is too long"}
  
  validates :postcode, :presence => { :message => "can't be blank" },
                   :format => { :with => postcode_regex, :message => "is the incorrect format"},
                   :length => { :maximum => 200, :message => "is too long"}
  
  validates :start_time, :presence => { :message => "can't be blank" }
                  
  validates :end_time, :presence => { :message => "can't be blank" }
  
  validates :organiser_name, :presence => { :message => "can't be blank\n" },
                   :length => { :maximum => 80, :message => "is too long"}
  
  validates :organiser_email, :presence => { :message => "can't be blank"},
                     :format => { :with => email_regex, :message => "is the incorrect format"}
                    

end
