class RemoveRewardFromAwards < ActiveRecord::Migration
  def change
    remove_reference :awards, :reward, index: true, foreign_key: true
  end
end
