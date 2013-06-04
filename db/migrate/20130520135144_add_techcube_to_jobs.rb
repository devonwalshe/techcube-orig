class AddTechcubeToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :techcube, :boolean
  end
end
