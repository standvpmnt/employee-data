class Asset < ApplicationRecord
  belongs_to :asset_detail
  validates_associated :asset_detail
  belongs_to :employee, optional: true
  validates :asset_identifier, presence: true, uniqueness: true
  has_many_attached :tags
end
