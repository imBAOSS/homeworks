class AddUsernameColumn < ActiveRecord::Migration
  def change
    add_column :users, :username, :string, null: false, unique: true
  end
end
