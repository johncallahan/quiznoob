class CreateBonuses < ActiveRecord::Migration
  def change
    create_table :bonuses do |t|
      t.references :user, index: true, foreign_key: true
      t.references :quiz, index: true, foreign_key: true
      t.integer :hearts

      t.timestamps null: false
    end
  end
end
