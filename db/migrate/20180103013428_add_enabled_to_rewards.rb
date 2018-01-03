class AddEnabledToRewards < ActiveRecord::Migration
  def change
    add_column :rewards, :enabled, :boolean, :default => true
  end
end
