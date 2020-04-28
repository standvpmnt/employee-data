class Employee < ApplicationRecord
  belongs_to :location
  validates_associated :location
  has_many :subordinates, class_name: "Employee", foreign_key: "manager_id"
  belongs_to :manager, class_name: "Employee", optional: true
  validates :employee_code, presence: true, uniqueness: true
  VALID_EMAIL_REGEX= /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :personal_email, format: {with: VALID_EMAIL_REGEX}, allow_blank: true
  validates :official_email, format: {with: VALID_EMAIL_REGEX}, allow_blank: false
  validates :date_of_joining, presence: true
  validates :personal_contact_no, uniqueness: true, length: {is: 10}
  has_one_attached :photo
  has_many :assets
  has_many :documents
  has_many :posting_histories
  has_many :attendance_histories
  has_many :appraisal_histories
  
end
