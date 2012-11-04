class AddMoveInDateToEnquiry < ActiveRecord::Migration
  def change
    add_column :enquiries, :movein_date, :datetime
  end
end
