require 'test_helper'

class AddressTest < ActiveSupport::TestCase
  # 5 digits, should pass
  test "Confirm that VALID records PASS validation and CAN be created (zip.size == 5)" do
    address = Address.new(:address_1 => "444 Park St", :city => "Montclair", :state => "nj", :zip => "07043", :user_id => 10)
    assert address.save
  end
  # 7 digits, should fail
  test "Confirm that INVALID records FAIL validation CANNOT be created (zip.size > 5)" do
    address = Address.new(:address_1 => "444 Park St", :city => "Montclair", :state => "nj", :zip => "0704321", :user_id => 10)
    assert !address.save
  end
  # 4 digits, should fail
  test "Confirm that INVALID records FAIL validation CANNOT be created (zip.size < 5)" do
    address = Address.new(:address_1 => "444 Park St", :city => "Montclair", :state => "nj", :zip => "0321", :user_id => 10)
    assert !address.save
  end
  # non-digit, should fail
  test "Confirm that INVALID records FAIL validation CANNOT be created (non digit)" do
    address = Address.new(:address_1 => "444 Park St", :city => "Montclair", :state => "nj", :zip => "0321B", :user_id => 10)
    assert !address.save
  end
end
