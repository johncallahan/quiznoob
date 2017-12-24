class AddImageToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :imageurl, :string
  end
end
