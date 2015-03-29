FactoryGirl.define do
  factory :notification do
    message 'This is a great candidate.'
    association :receiver, factory: :user
    association :sender, factory: :user
    association :candidate, factory: :candidate
  end

end
