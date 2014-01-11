require 'spec_helper'

feature 'user creates group', %Q{
  As a user
  I want to create a group
  So that my homeschooling group can use the app
} do

  # ACCEPTANCE CRITERIA:
  # *   I must be signed in to create a group.
  # *   If I am not signed in, I am not granted access to create a group.
  # *   I must specify a unique name, a description, and a location.
  # *   If I do not specify the required attributes, I receive error messages.

  let!(:user) { FactoryGirl.create(:user) }
  let!(:group) { FactoryGirl.build(:group, organizer: user) }

  scenario 'user supplies valid attributes' do
    login(user)
    click_on 'Add Group'
    fill_in 'Name', with: group.name
    fill_in 'Description', with: group.description
    fill_in 'Location', with: group.location
    click_on 'Create Group'

  end
end
