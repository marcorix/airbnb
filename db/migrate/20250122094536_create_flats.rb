class CreateFlats < ActiveRecord::Migration[7.1]
  def change
    create_table :flats do |t|
      t.string :name
      t.string :address
      t.string :price
      t.string :description
      t.string :guests
      t.string :property_type

      t.timestamps
    end
  end
end
