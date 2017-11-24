class AddUtcoffsetToUser < ActiveRecord::Migration
  def change
    add_column :users, :utcoffset, :integer
  end
end
