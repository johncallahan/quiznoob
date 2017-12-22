class RemoveUserFromAward < ActiveRecord::Migration
  def change
    remove_reference :awards, :user, foreign_key: { on_delete: :nullify }, index: true
    remove_column :awards, :hearts
  end
end
