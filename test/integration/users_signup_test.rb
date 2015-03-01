require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest

	test "invalid sign up information" do
  	get signup_path
  	before_count = User.count
  	post users_path, user: {name: "", email: "thomas@thomas.com", password: "pass", password_confirmation: "pass" }
  	assert_tempalte 'users/new'
	end
end
