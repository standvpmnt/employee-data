class CreateDepartments < ActiveRecord::Migration[6.0]
  def change
    create_table :departments do |t|
      t.string :name
      t.boolean :enabled, default: true
    end
    add_reference :employees, :department
  end
end