class CreateFollowers < ActiveRecord::Migration[6.0]
  def change
    create_table :followers do |t|
      t.references :follower,refernces: :users
      t.references :following,refernces: :users
      t.timestamps
    end
  end
end
