class AddEnabledToQuizzes < ActiveRecord::Migration
  def change
    add_column :quizzes, :enabled, :boolean
  end
end
