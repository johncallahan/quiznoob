class AddHeartsToQuizzes < ActiveRecord::Migration
  def change
    add_column :quizzes, :hearts, :int, :default => 0
  end
end
