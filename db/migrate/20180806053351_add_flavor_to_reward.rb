class AddFlavorToReward < ActiveRecord::Migration
  def change
    add_column :rewards, :flavor, :integer
  end
end
