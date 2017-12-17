class CreateRedemptions < ActiveRecord::Migration
  def change
    create_table :redemptions do |t|
      t.references :user, index: true, foreign_key: true
      t.references :reward, index: true, foreign_key: true
      t.integer :hearts

      t.timestamps null: false
    end
  end
end
