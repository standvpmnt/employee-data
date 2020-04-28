class PostingHistory < ApplicationRecord
  belongs_to :location
  belongs_to :employee
  validates_associated :location
  validates_associated :employee
  validates :start_date, presence: true
end
