class CreateAwards < ActiveRecord::Migration
  def change
    create_table :awards do |t|
      t.references :user, index: true, foreign_key: true
      t.integer :hearts

      t.timestamps null: false
    end
  end
end
