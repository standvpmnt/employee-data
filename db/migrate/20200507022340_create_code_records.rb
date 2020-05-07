class CreateCodeRecords < ActiveRecord::Migration[6.0]
  def change
    create_table :code_records do |t|
      t.references :location, null: false, foreign_key: true
      t.references :employee, null: false, foreign_key: true
      t.integer :employee_count
      t.string :code

      t.timestamps
    end
  end
end
