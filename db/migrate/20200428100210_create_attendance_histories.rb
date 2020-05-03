class CreateAttendanceHistories < ActiveRecord::Migration[6.0]
  def change
    create_table :attendance_histories do |t|
      t.references :employee, null: false, foreign_key: true
      t.date :start_date
      t.date :end_date
      t.integer :working_days
      t.integer :sick_leaves, default: 0
      t.integer :casual_leaves, default: 0
      t.string :updated_by

      t.timestamps
    end
  end
end
