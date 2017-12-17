class AddHeartsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :hearts, :int, :default => 0
  end
end
