class CreateAssetDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :asset_details do |t|
      t.string :type
      t.string :identifier_type
      t.boolean :enabled, default: true

    end
  end
end
