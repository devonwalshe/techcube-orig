class AddLiveAndExpiryDatesToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :live_date, :date
    add_column :jobs, :expiry_date, :date
  end
end
