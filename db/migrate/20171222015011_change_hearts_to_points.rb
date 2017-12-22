class ChangeHeartsToPoints < ActiveRecord::Migration
  def change
    rename_column :quizzes, :hearts, :points
  end
end
