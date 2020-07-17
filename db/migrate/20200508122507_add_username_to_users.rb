class AddUsernameToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :avatar, :string
    add_column :users, :username, :string, limit: 20
    add_column :users, :first_name, :string, limit: 20
    add_column :users, :last_name, :string, limit: 20
    add_column :users, :bio, :string
  end
end
