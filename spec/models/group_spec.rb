require 'spec_helper'

describe Group do
  let!(:group) { FactoryGirl.create(:group) }

  it { should validate_presence_of :organizer_id }
  it { should validate_presence_of :name }
  it { should validate_presence_of :description }
  it { should validate_presence_of :location }

  it { should validate_uniqueness_of :name }
  it { should belong_to(:organizer).class_name('User').with_foreign_key(:organizer_id) }
end
