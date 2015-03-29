FactoryGirl.define do
  factory :candidate do
    sequence(:email) {|n| "candidate#{n}@example.com" }
    first_name Faker::Name.first_name
    last_name Faker::Name.last_name
    skill 'Skil1, Skill2, Skill3'
    phone '123443'
  end

end
