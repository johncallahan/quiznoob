class ChangeHeartsToCost < ActiveRecord::Migration
  def change
    rename_column :rewards, :hearts, :cost
  end
end
