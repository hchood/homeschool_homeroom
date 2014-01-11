require 'spec_helper'

feature "member of a group views the group's proposed topics", %Q{
  As a member of a group
  I want to view a group's topics
  So that I can upvote or claim them
} do

  # ACCEPTANCE CRITERIA:
  # *   Group topics are displayed when I navigate to the group's page.
  # *   I can view topics if I am a member of the group.
  # *   I cannot view the group's page if I am not a member of the group.
  # *   I cannot view topics if I am not signed in.

  let!(:user)   { FactoryGirl.create(:user) }
  let!(:group)  { FactoryGirl.create(:group) }
  let!(:topic)  { FactoryGirl.create(:topic, group: group) }

  scenario 'user is member of group' do
    login(user)
    click_on 'Join'

    expect(page).to have_content topic.name
  end

  scenario 'user is not a member of group' do
    login(user)
    visit "/groups/#{group.id}"

    expect(page).to have_content "You must be a member to view a group's profile."
  end

  scenario 'user is not signed in' do
    visit "/groups/#{group.id}"

    expect(page).to_not have_content topic.name
    expect(page).to have_content 'You need to sign in or sign up before continuing'
  end
end
