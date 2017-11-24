class AddStartedatToAttempts < ActiveRecord::Migration
  def change
    add_column :attempts, :startedat, :datetime
  end
end
