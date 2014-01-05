require 'spec_helper'

describe Owner do

	it { should have_valid(:first_name).when("Joey") }
	it { should_not have_valid(:first_name).when(nil, "") }

	it { should have_valid(:last_name).when("Lawrence") }
	it { should_not have_valid(:last_name).when(nil, "") }

	it { should have_valid(:email).when("jl@example.com") }
	it { should_not have_valid(:email).when(nil, "", "jlexample.com") }

	it { should have_valid(:company_name).when("Disney") }

  	it { should have_many(:buildings) }
end
