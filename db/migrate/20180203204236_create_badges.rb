class CreateBadges < ActiveRecord::Migration
  def change
    create_table :badges do |t|
      t.string :name
      t.references :subject

      t.timestamps null: false
    end
  end
end
