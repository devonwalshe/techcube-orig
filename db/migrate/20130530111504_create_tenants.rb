class CreateTenants < ActiveRecord::Migration
  def change
    create_table :tenants do |t|
      t.string :logo
      t.string :name
      t.string :website
      t.text :description
      t.string :contact_email
      t.string :principal_contact_name
      t.string :room_number
      t.string :tenant_type

      t.timestamps
    end
  end
end
