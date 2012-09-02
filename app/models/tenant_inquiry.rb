class TenantInquiry < ActiveRecord::Base
  attr_accessible :company, :email, :employees, :name, :phone, :pitch
end
