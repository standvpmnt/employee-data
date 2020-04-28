class CreateAppraisalHistories < ActiveRecord::Migration[6.0]
  def change
    create_table :appraisal_histories do |t|
      t.references :employee, null: false, foreign_key: true
      t.date :effective_date
      t.string :last_designation
      t.integer :last_salary
      t.string :new_designation
      t.integer :new_salary
      t.string :updated_by

      t.timestamps
    end
  end
end
