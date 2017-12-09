class AddResultToAttempts < ActiveRecord::Migration
  def change
    add_column :attempts, :result, :boolean
  end
end
