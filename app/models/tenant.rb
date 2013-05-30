class Tenant < ActiveRecord::Base
  attr_accessible :contact_email, :description, :logo, :name, :principal_contact_name, :room_number, :tenant_type, :website
end
