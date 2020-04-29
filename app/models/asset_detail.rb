class AssetDetail < ApplicationRecord
  has_many :assets
  validates :asset_category, presence: true, uniqueness: true
end
