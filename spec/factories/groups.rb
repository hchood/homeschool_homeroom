FactoryGirl.define do
  factory :group do
    association :organizer

    sequence(:name) { |n| "Group #{n}" }
    description 'Middle schoolers who love art'
    location 'Greater Boston'
  end
end
