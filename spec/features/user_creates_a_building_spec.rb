require 'spec_helper'

feature "User creates a building", %q{
  As a real estate associate
  I want to record a building
  So that I can refer back to pertinent information
} do

	# Acceptance Criteria:
	# * I must specify a street address, city, state, and postal code
	# * Only US states can be specified
	# * I can optionally specify a description of the building
	# * If I enter all of the required information in the required format, the building is recorded.
	# * If I do not specify all of the required information in the required formats, the building is not recorded and I am presented with errors
	# * Upon successfully creating a building, I am redirected so that I can record another building.

	context "with valid attributes" do
		it "creates a building with valid attributes" do
			street_address = "123 park lane"
    		city = "New York"
    		state = "NY"
    		postal_code = "10024"

			visit new_building_path
			fill_in "Street address", with: street_address
			fill_in "City", with: city
			fill_in "State", with: state
			fill_in "Postal code", with: postal_code
			click_on "Create Building"

			expect(page).to have_content street_address
			expect(page).to have_content city
			expect(page).to have_content state
			expect(page).to have_content postal_code
		end

	end

	context "with invalid attributes" do
		it 'sees applicable errors' do
			visit new_building_path

      		click_on "Create Building"

      		expect(page).to have_content "Street address can't be blank"
      		expect(page).to have_content "City can't be blank"
      		expect(page).to have_content "State can't be blank"
      		expect(page).to have_content "Postal code can't be blank"

		end
	end
end