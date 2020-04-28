class DocumentType < ApplicationRecord
  has_many :documents
  validates :type, presence: true, uniqueness: true
  
end
