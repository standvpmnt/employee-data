class AssetDetailSerializer < ActiveModel::Serializer
  attributes :id, :asset_category, :identifier_type, :enabled
end
