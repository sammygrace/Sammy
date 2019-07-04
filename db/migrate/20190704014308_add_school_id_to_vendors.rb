class AddSchoolIdToVendors < ActiveRecord::Migration[5.2]
  def change
    add_column :vendors, :school_id, :integer
    add_index :vendors, :school_id
  end
end
