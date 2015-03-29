FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "person#{n}@teamtailor.com" }
    first_name Faker::Name.first_name
    last_name Faker::Name.last_name
    password 'password'
  end

end
