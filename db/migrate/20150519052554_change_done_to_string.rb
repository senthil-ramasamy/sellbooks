class ChangeDoneToString < ActiveRecord::Migration
  def change
	change_column :sells, :done, :string, :default => "true"
  end
end
