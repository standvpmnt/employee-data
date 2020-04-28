class Location < ApplicationRecord
  has_many :employees
  validates :code, uniqueness: true, presence: true
  validates :pin_code, length: {is: 6}
end