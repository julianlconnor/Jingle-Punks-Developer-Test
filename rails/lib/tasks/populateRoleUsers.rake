namespace :populateRoleUsers do
  desc 'Creates habtm entries for role_users'
  task :go => :environment do
    @users = User.all
    puts "Building associations between Users & Roles\n"
    puts "This may take a while..\n"
    @users.each do |user|
      # Some users do not have roles, only build entries for users with roles
      if !user.role_id.nil?
        @role = Role.first(:conditions => {:id => user.role_id})
        roles_users_object = RoleUser.new(:role_id => @role.id, :user_id => user.id)
        roles_users_object.save
      end
    end
    puts "Done."
  end
end