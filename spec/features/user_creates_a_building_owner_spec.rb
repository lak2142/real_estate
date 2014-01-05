require 'spec_helper'

feature "User creates a building", %q{
	As a real estate associate
	I want to record a building owner
	So that I can keep track of our relationships with owners
} do

	# * Acceptance Criteria:
	# * I must specify a first name, last name, and email address
	# * I can optionally specify a company name
	# * If I do not specify the required information, I am presented with errors
	# * If I specify the required information, the owner is recorded and I am redirected to enter another new owner

	context "with valid attributes" do
		it "creates an owner with valid attributes" do
			first_name = "John"
			last_name = "smith"
			email = "abc@123.com"
			company = "Microsoft"
			
			visit new_owner_path
			fill_in "First name", with: first_name
			fill_in "Last name", with: last_name
			fill_in "Email", with: email
			fill_in "Company name", with: company

			click_on "Create Owner"

			expect(page).to have_content first_name
			expect(page).to have_content last_name
			expect(page).to have_content email
			expect(page).to have_content company
		end

	end

	context "with invalid attributes" do
		it 'sees applicable errors' do
			visit new_owner_path

			click_on "Create Owner"

			expect(page).to have_content "First name can't be blank"
			expect(page).to have_content "Last name can't be blank"
			expect(page).to have_content "Email can't be blank"
			expect(page).not_to have_content "Company name can't be blank"

		end
	end



end