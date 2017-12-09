class RemoveProgressFromAttempts < ActiveRecord::Migration
  def change
    remove_column :attempts, :progress, :int
  end
end
