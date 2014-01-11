require 'spec_helper'

feature 'authenticated user views groups', %Q{
  As an authenticated user
  I want to view homeschooling groups
  So that I can join them
} do

  # ACCEPTANCE CRITERIA:
  # *   Upon signing in, I am shown the name, description, and location for all groups that exist
  # *   I cannot view groups if I am not signed in.

  let!(:user)   { FactoryGirl.build(:user) }
  let!(:group1) { FactoryGirl.create(:group) }
  let!(:group2) { FactoryGirl.create(:group) }

  scenario 'authenticated user views groups' do
    login(user)

    expect(page).to have_content group1.name
    expect(page).to have_content group1.description
    expect(page).to have_content group1.location

    expect(page).to have_content group2.name
    expect(page).to have_content group2.description
    expect(page).to have_content group2.location
  end

  scenario 'unauthenticated user tries to view groups' do
    visit '/groups'

    expect(page).to have_content 'You need to sign in or sign up before continuing'
    expect(page).to_not have_content group1.name
  end
end
