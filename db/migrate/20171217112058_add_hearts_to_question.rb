class AddHeartsToQuestion < ActiveRecord::Migration
  def change
    add_column :questions, :hearts, :int, :default => 0
  end
end
