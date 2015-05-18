class AddCountToRefer < ActiveRecord::Migration
  def change
    add_column :refers, :count, :integer, :null => false, :default => 0
  end
end
