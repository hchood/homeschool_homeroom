FactoryGirl.define do
  factory :topic do
    association :author
    association :group

    name 'Ruby on Rails'
    description 'I really want to learn about this.'
  end
end
