class CreatePrerequisites < ActiveRecord::Migration
  def change
    create_table :prerequisites do |t|
      t.references :badge
      t.references :quiz

      t.timestamps null: false
    end
  end
end
