class AddDescriptionToQuizzes < ActiveRecord::Migration
  def change
    add_column :quizzes, :description, :string
  end
end
