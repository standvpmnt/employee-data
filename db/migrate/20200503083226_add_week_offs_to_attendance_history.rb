class AddWeekOffsToAttendanceHistory < ActiveRecord::Migration[6.0]
  def change
    add_column :attendance_histories, :week_offs, :integer, default: 0
    add_column :attendance_histories, :half_days, :integer, default: 0
  end
end
