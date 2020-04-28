class CreateEmployees < ActiveRecord::Migration[6.0]
  def change
    create_table :employees do |t|
      t.references :location, null: false, foreign_key: true
      t.string :employee_code
      t.string :name
      t.date :dob
      t.string :gender
      t.string :current_designation
      t.date :date_of_joining
      t.string :blood_group
      t.string :personal_contact_no
      t.string :father_name
      t.string :mother_name
      t.string :emergency_contact_no
      t.string :emergency_contact_name
      t.string :emergency_contact_relation
      t.string :personal_email
      t.string :official_email
      t.text :local_address
      t.string :permanent_address
      t.boolean :isManager
      t.references :manager
      t.date :date_of_leaving
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
