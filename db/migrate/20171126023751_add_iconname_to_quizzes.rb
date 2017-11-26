class AddIconnameToQuizzes < ActiveRecord::Migration
  def change
    add_column :quizzes, :iconname, :string
  end
end
