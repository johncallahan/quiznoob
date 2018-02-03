class AddAncestryToBadges < ActiveRecord::Migration
  def change
    add_column :badges, :ancestry, :string
    add_index :badges, :ancestry
  end
end
