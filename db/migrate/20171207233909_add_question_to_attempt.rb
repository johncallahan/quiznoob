class AddQuestionToAttempt < ActiveRecord::Migration
  def change
    add_reference :attempts, :question, index: true, foreign_key: true
  end
end
