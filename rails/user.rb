class User < ActiveRecord::Base
  belongs_to :role
  has_one :address
end
