# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :building do
  	street_address "123 park lane"
    city "New York"
    state "NY"
    postal_code "10024"
  end
end

