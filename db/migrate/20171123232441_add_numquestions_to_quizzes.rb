class AddNumquestionsToQuizzes < ActiveRecord::Migration
  def change
    add_column :quizzes, :numquestions, :integer
  end
end
