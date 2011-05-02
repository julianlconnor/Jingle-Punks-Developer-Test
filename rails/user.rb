class User < ActiveRecord::Base
  has_many :role_users
  has_many :roles, :through => :role_users
  
  has_one :address
  
  scope :with_role, lambda{ |roleName| joins('JOIN roles ON users.role_id = roles.id').where('roles.name = ?', roleName.downcase) }
  scope :lives_in, lambda{ |state| joins('JOIN addresses ON users.id = addresses.user_id').where('state = ?', state.downcase) }
  
end
