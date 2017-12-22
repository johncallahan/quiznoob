class ChangeHeartsToBonus < ActiveRecord::Migration
  def change
    rename_column :questions, :hearts, :bonus
  end
end
