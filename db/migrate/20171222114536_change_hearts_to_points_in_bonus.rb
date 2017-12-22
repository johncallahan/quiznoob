class ChangeHeartsToPointsInBonus < ActiveRecord::Migration
  def change
    rename_column :bonuses, :hearts, :points
  end
end
