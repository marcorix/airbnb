class CreateFlats < ActiveRecord::Migration[7.0]
  def change
    create_table :flats do |t|
      t.string :name
      t.text :description
      t.string :country
      t.string :city
      t.integer :guests
      t.integer :bedrooms
      t.integer :beds
      t.integer :price
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
