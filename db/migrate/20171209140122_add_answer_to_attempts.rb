class AddAnswerToAttempts < ActiveRecord::Migration
  def change
    add_reference :attempts, :answer, index: true, foreign_key: true
  end
end
