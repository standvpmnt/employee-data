class DocumentType < ApplicationRecord
  has_many :documents
  validates :document_category, presence: true, uniqueness: true
  
end
