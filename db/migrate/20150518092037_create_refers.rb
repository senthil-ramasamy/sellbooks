class CreateRefers < ActiveRecord::Migration
  def change
    create_table :refers do |t|
      t.string :name
      t.string :email
      t.date :registered_on
      t.integer :phnumber
      t.string :refid

      t.timestamps null: false
    end
    add_index :refers, :refid, unique: true
  end
end
