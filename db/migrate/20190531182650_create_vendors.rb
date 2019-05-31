class CreateVendors < ActiveRecord::Migration[5.2]
  def change
    create_table :vendors do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.string :address
      t.string :website
      t.string :description
      t.text :content

      t.timestamps
    end
  end
end
