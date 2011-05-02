class CreateRoleUsers < ActiveRecord::Migration
  def self.up
    create_table :role_users, :id => false do |t|
      t.references :role
      t.references :user
    end
    User.reset_column_information
    Role.reset_column_information
    User.all.each do |user|
      # Some users do not have roles, only build entries for users with roles
      if !user.role_id.nil?
        @role = Role.first(:conditions => {:id => user.role_id})
        roles_users_object = RoleUser.new(:role_id => @role.id, :user_id => user.id)
        roles_users_object.save!
      end
    end
  end

  def self.down
    drop_table :role_users
  end
end
