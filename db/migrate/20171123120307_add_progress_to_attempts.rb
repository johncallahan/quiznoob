class AddProgressToAttempts < ActiveRecord::Migration
  def change
    add_column :attempts, :progress, :integer
  end
end
