class AddSourceToAwards < ActiveRecord::Migration
  def change
    add_reference :awards, :source, polymorphic: true, index: true
  end
end
