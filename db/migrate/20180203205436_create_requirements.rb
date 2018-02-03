class CreateRequirements < ActiveRecord::Migration
  def change
    create_table :requirements do |t|
      t.references :badge
      t.references :quiz

      t.timestamps null: false
    end
  end
end
