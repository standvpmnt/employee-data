class CreatePostingHistories < ActiveRecord::Migration[6.0]
  def change
    create_table :posting_histories do |t|
      t.references :location, null: false, foreign_key: true
      t.references :employee, null: false, foreign_key: true
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
