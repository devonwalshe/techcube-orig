class Job < ActiveRecord::Base
  attr_accessible :approved, :company_description, :company_name, :how_to, :job_description, :job_title, :location, :person_description, :postcode, :salary, :user_email, :user_name, :start_date

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

  private
  
  
  def live_jobs
      Job.where("today >= live_date AND today <= expiry_date")
  end
  

end
