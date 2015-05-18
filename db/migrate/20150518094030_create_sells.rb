class CreateSells < ActiveRecord::Migration
  def change
    create_table :sells do |t|
      t.string :name
      t.string :email
      t.integer :phnumber
      t.string :refer
      t.integer :noofbooktosell
      t.string :collegename

      t.timestamps null: false
    end
  end
end
