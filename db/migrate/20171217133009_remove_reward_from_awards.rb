class RemoveRewardFromAwards < ActiveRecord::Migration
  def change
    remove_reference :awards, :reward
  end
end
