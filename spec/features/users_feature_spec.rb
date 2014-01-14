require 'spec_helper'

describe UsersController do
	describe "User Registration and Sign In" do
		before do
			@email = "daniel@example.com"
			@password = "12345678"
			visit new_user_registration_path
			fill_in :Email, with: @email
			fill_in :Password, with: @password
			fill_in "Password confirmation", with: @password
			click_button "Sign up"
		end
		it "user is signed in" do
			current_path.should == '/'
			page.should have_content(@email)
		end
		it "user logs out" do
			visit '/'
			click_link "logout"
			page.should_not have_content(@email)
		end
		it "existing user logs in" do
			visit '/'
			click_link "logout"
			page.should_not have_content(@email)
			click_link "sign-in"
			fill_in :Email, with: @email
			fill_in :Password, with: @password
			click_button "Sign in"
			page.should have_content(@email)
		end
	end
end