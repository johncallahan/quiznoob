class AddMinimumToQuiz < ActiveRecord::Migration
  def change
    add_column :quizzes, :minimum, :integer
  end
end
