class CreateAttendanceHistories < ActiveRecord::Migration[6.0]
  def change
    create_table :attendance_histories do |t|
      t.references :employee, null: false, foreign_key: true
      t.date :start_date
      t.date :end_date
      t.integer :working_days
      t.integer :sick_leaves
      t.integer :casual_leaves
      t.string :updated_by

      t.timestamps
    end
  end
end
