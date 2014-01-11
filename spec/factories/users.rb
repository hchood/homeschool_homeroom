# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    first_name 'George'
    last_name 'Bluth'
    sequence(:email) { "georgemichael#{n}@bananastand.com"}
    interests 'bananas, cousins, doing the Charlie Brown mopey walk'
  end
end

