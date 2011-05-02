class Address < ActiveRecord::Base
  belongs_to :user
  
  validates_format_of :zip, :with => /^\d{5}$/, :message => "ZipCode should be 5 digits!"
  
  scope :lives_in, lambda{ |stateName| where('state = ?',stateName) }
end
