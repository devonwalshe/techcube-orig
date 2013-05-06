class AddHoursPerWeekToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :hours_per_week, :string
  end
end
