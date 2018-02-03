class AddAncestryToQuizzes < ActiveRecord::Migration
  def change
    add_column :quizzes, :ancestry, :string
    add_index :quizzes, :ancestry
  end
end
