class AppraisalHistory < ApplicationRecord
  belongs_to :employee
  validates_associated :employee
  validates :effective_date, presence: true
end
