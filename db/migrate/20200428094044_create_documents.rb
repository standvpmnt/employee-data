class CreateDocuments < ActiveRecord::Migration[6.0]
  def change
    create_table :documents do |t|
      t.references :employee, null: false, foreign_key: true
      t.references :document_type, null: false, foreign_key: true

    end
  end
end
