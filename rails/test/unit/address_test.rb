require 'test_helper'

class AddressTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "Confirm that VALID records PASS validation and CAN be created (zip.size == 5)" do
    address = Address.new(:address_1 => "444 Park St", :city => "Montclair", :state => "nj", :zip => "07043", :user_id => 10)
    assert address.save
  end
  test "Confirm that INVALID records FAIL validation CANNOT be created (zip.size > 5)" do
    address = Address.new(:address_1 => "444 Park St", :city => "Montclair", :state => "nj", :zip => "0704321", :user_id => 10)
    assert !address.save
  end
  test "Confirm that INVALID records FAIL validation CANNOT be created (zip.size < 5)" do
    address = Address.new(:address_1 => "444 Park St", :city => "Montclair", :state => "nj", :zip => "0321", :user_id => 10)
    assert !address.save
  end
end
