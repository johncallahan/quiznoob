class RemovePointsFromBonuses < ActiveRecord::Migration
  def change
    remove_column :bonuses, :points
  end
end
