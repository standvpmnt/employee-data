class Document < ApplicationRecord
  belongs_to :employee
  belongs_to :document_type
  validates_associated :employee
  validates_associated :document_type
  has_many_attached :docs
end
