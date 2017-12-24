class ChangeHeartsToCostInRedemption < ActiveRecord::Migration
  def change
    rename_column :redemptions, :hearts, :cost
  end
end
