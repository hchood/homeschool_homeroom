require 'spec_helper'

feature 'group member creates a topic', %Q{
  As a group member
  I want to create a topic
  So that another member can volunteer to teach the group about it
} do

  # ACCEPTANCE CRITERIA:
  # *   I must be signed in to create a topic.
  # *   I must be a member of the group to create a topic in it.
  # *   I must click on the create topic option on the group's page to create a topic.
  # *   I must supply a name and description.
  # *   If I do not supply a name and description, I receive an error message.
  # *   If the topic is successfully created, I am redirected to the group's profile page.

  let!(:user) { FactoryGirl.create(:user) }
  let!(:group) { FactoryGirl.create(:group) }

  scenario 'member supplies all required attributes' do
    login(user)
    click_on 'Join'
    click_on 'Propose a lesson topic'
    fill_in 'Name', with: 'Coding'
    fill_in 'Description', with: 'I want to learn Ruby on Rails.'
    click_on 'Create Topic'


    # it creates a new Topic object
    expect(Topic.count).to eq 1

    # it redirects to the group's profile page
    expect(page).to have_content group.name
    expect(page).to have_content 'Coding'
  end

  scenario 'member does not supply all required attributes'

  scenario 'unauthorized user tries to create topic'

  scenario 'non-member tries to create topic'

end
