class AssetDetail < ApplicationRecord
  has_many :assets
  validates :type, presence: true, uniqueness: true
end
