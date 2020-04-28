class AttendanceHistory < ApplicationRecord
  belongs_to :employee
  validates_associated :employee
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :working_days, numericality: {only_integer: true}
  validates :sick_leaves, numericality: {only_integer: true}
  validates :casual_leaves, numericality: {only_integer: true}
end
