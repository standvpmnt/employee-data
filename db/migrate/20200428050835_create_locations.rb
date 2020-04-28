class CreateLocations < ActiveRecord::Migration[6.0]
  def change
    create_table :locations do |t|
      t.string :city
      t.string :district
      t.string :state
      t.string :country
      t.text :address
      t.string :code
      t.boolean :active, default: true
      t.string :pin_code

      t.timestamps
    end
  end
end
