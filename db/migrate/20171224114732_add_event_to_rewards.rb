class AddEventToRewards < ActiveRecord::Migration
  def change
    add_column :rewards, :event, :string
  end
end
