require 'spec_helper'

feature 'authenticated user joins group', %Q{
  As an authenticated user
  I want to join a group
  So that I can propose topics for the group to study
} do

  # ACCEPTANCE CRITERIA:
  # *   I am added to the group's membership list when I click on "join".
  # *   I cannot join a group if I am not signed in.
  # *   I am redirected to that group's page upon joining the group.
  # *   If I am already in the group, I do not see a "join" link that I can click on.

  let!(:user) { FactoryGirl.create(:user) }
  let!(:group) { FactoryGirl.create(:group) }

  scenario 'authenticated user joins group' do
    login(user)
    click_on 'Join'

    # creates a Membership record
    expect(Membership.count).to eq 1

    # updates the groups' memberships list
    expect(group.memberships.count).to eq 1

    # redirects to /groups/1
    expect(current_path).to eq "/groups/#{group.id}"

    # displays welcome message
    expect(page).to have_content "Welcome to #{group.name}!"
  end

  scenario 'unauthenticated user tries to join group'

  scenario 'user is already member of group'
end
