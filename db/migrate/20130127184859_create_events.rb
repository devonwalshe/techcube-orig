class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :event_title
      t.text :event_summary
      t.text :event_description
      t.string :location
      t.string :postcode
      t.string :organiser_name
      t.string :organiser_email
      t.datetime :start_time
      t.datetime :end_time
      t.boolean :approved
      
      t.timestamps
    end
  end
end
