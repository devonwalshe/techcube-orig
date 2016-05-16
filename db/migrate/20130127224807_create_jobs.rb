class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :company_name
      t.string :job_title
      t.string :location
      t.string :postcode
      t.string :salary
      t.text :job_description
      t.text :person_description
      t.text :company_description
      t.text :how_to
      t.string :user_name
      t.string :user_email
      t.boolean :approved
      t.datetime :start_date
      
      t.timestamps
    end
  end
end
