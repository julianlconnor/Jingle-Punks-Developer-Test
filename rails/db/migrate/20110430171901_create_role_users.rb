class CreateRoleUsers < ActiveRecord::Migration
  def self.up
    create_table :role_users, :id => false do |t|
      t.references :role
      t.references :user
    end
  end

  def self.down
    drop_table :role_users
  end
end
