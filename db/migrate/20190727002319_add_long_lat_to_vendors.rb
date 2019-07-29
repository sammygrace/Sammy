class AddLongLatToVendors < ActiveRecord::Migration[5.2]
  def change
    add_column :vendors, :longitude, :float
    add_column :vendors, :latitude, :float
  end
end
