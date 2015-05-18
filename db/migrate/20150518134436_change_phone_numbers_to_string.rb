class ChangePhoneNumbersToString < ActiveRecord::Migration
  def change
	change_column :refers, :phnumber, :string
	change_column :sells, :phnumber, :string
  end
end
