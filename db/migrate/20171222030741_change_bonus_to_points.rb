class ChangeBonusToPoints < ActiveRecord::Migration
  def change
    rename_column :questions, :bonus, :points
  end
end
