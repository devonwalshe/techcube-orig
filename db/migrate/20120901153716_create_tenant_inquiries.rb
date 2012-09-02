class CreateTenantInquiries < ActiveRecord::Migration
  def change
    create_table :tenant_inquiries do |t|
      t.string :email
      t.text :employees
      t.string :company
      t.string :name
      t.string :phone
      t.text :pitch

      t.timestamps
    end
  end
end
