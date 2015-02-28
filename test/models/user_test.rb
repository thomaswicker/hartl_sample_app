require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
  	@user = User.new(name: "Thomas", email: "test@test.com")
  end

  test "should be vaild" do
  	assert @user.valid?
  end

  test "name should be present" do
  	@user.name = "     "
  	assert_not @user.valid?
  end

  test "email should be present" do
  	@user.email = "     "
  	assert_not @user.valid?
  end

  test "name should not be too long" do
   	@user.name = "a" * 51
   	assert_not @user.valid?
  end

  test "email should not be too long" do
   	@user.name = "a" * 256
   	assert_not @user.valid?
  end

  test "email validation should accept valid addresses" do
   	valid_addresses = %w[user@example.com USER@foo.com A_US-ER@foo.org first.last@foo.jp alice+bob@baz.cn]
   	valid_addresses.each do |valid_address|
   		@user.email = valid_address
   		assert @user.valid?
   	end
  end

  test "email should reject invalid address" do
   	invalid_addresses = %w[user@example,com user_at_foo.org user.name@example. foo@bar_baz.com foo@bar+baz.com]
   	invalid_addresses.each do |invalid_address|
   		@user.email = invalid_address
   		assert_not @user.valid?
   	end
  end
end
