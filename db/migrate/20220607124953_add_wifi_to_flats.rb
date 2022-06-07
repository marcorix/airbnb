class AddWifiToFlats < ActiveRecord::Migration[7.0]
  def change
    add_column :flats, :wifi, :boolean
  end
end
