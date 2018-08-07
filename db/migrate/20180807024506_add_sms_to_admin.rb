class AddSmsToAdmin < ActiveRecord::Migration
  def change
    add_column :admins, :smsmail, :string
  end
end
