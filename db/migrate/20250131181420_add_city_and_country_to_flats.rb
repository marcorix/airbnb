class AddCityAndCountryToFlats < ActiveRecord::Migration[7.1]
  def change
    add_column :flats, :city, :string
    add_column :flats, :country, :string
  end
end
