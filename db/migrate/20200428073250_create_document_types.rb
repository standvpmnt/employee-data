class CreateDocumentTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :document_types do |t|
      t.string :document_category
      t.boolean :enabled, default: true

    end
  end
end
