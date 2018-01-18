class AddSampleToQuizzes < ActiveRecord::Migration
  def change
    add_column :quizzes, :sample, :integer, :null => false, :default => 10
  end
end
