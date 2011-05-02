class Address < ActiveRecord::Base
  belongs_to :user
  validates_length_of  :zip, :is => 5, :message => "ZipCode should be 5 digits!"
  
  scope :lives_in, lambda{ |stateName| where('state = ?',stateName) }
end
