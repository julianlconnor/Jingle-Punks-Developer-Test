class Role < ActiveRecord::Base
  has_many :role_users
  has_many :users, :through => :role_users
  
  scope :with_role, lambda { |roleName| where("name = ?",roleName) }
  
end
