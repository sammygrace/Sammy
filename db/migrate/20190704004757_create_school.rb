class CreateSchool < ActiveRecord::Migration[5.2]
  def change
    create_table :schools do |t|
      t.string :name
      t.string :address
      t.string :email
      t.string :website
    end
  end
end
