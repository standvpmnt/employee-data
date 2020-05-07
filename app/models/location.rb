class Location < ApplicationRecord
  has_many :employees
  has_many :code_records
  validates :code, uniqueness: true, presence: true
  validates :pin_code, length: {is: 6}
end