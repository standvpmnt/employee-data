class CreateAssets < ActiveRecord::Migration[6.0]
  def change
    create_table :assets do |t|
      t.references :asset_detail, null: false, foreign_key: true
      t.string :asset_identifier
      t.references :employee, null: true, foreign_key: true
      t.string :note
      t.string :updated_by
      t.boolean :in_store, default: true

      t.timestamps
    end
  end
end
