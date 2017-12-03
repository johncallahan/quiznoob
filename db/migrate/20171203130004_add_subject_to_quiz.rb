class AddSubjectToQuiz < ActiveRecord::Migration
  def change
    add_reference :quizzes, :subject, index: true, foreign_key: true
  end
end
