require 'spec_helper'

describe Building do

	it { should have_valid(:street_address).when("123 park street") }
	it { should_not have_valid(:street_address).when(nil, "") }

	it { should have_valid(:city).when("New York") }
	it { should_not have_valid(:city).when(nil, "") }

	it { should have_valid(:state).when("New York") }
	it { should_not have_valid(:state).when(nil, "") }

	it { should have_valid(:postal_code).when("01234") }
	it { should_not have_valid(:postal_code).when(nil, "", "123456") }

  	it { should belong_to :owner }
end
