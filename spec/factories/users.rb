# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user, aliases: [:organizer, :author] do
    first_name 'George'
    last_name 'Bluth'
    sequence(:email) { |n| "georgemichael#{n}@bananastand.com"}
    password '12345678'
    password_confirmation '12345678'
    interests 'bananas, cousins, doing the Charlie Brown mopey walk'
  end
end

