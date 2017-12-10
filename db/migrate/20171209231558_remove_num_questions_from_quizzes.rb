class RemoveNumQuestionsFromQuizzes < ActiveRecord::Migration
  def change
    remove_column :quizzes, :numquestions, :int
  end
end
