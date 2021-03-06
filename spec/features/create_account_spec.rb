require 'spec_helper'

feature 'new user creates an account', %Q{
  As a prospective user
  I want to create an account
  So that I can join a homeschooling group
} do

  # ACCEPTANCE CRITERIA:
  # *   I must specify a first name, last name, and valid email address
  # *   I can optionally specify my interests
  # *   If I don't specify a first name, last name, and valid email address, I receive error messages.
  # *   If I do specify valid attributes, my account is created and I am logged in.

  # LATER ACCEPTANCE CRITERIA:
  # *   I must select whether I am a parent or a student.  [ CAN USE JS TO HIDE / SHOW ATTRIBUTE FIELDS ]
  # *   => If I am a parent, I must provide my address and a valid phone number.
  # *   => If I am a student, I must select a grade, pre-K through 12.
  # *   If I do not provide that information, I receive error messages.

  # NOTE:  Emails don't have to be unique but maybe get a confirmation message if already in the system?

  let!(:user) { FactoryGirl.build(:user) }

  scenario 'provides valid attributes' do
    visit '/'
    click_on 'Sign Up'
    fill_in 'First Name', with: user.first_name
    fill_in 'Last Name', with: user.last_name
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    fill_in 'Password Confirmation', with: user.password_confirmation
    fill_in 'Interests', with: user.interests
    click_on 'Sign me up!'

    expect(page).to have_content "Welcome! You have signed up successfully"
    expect(page).to_not have_link 'Sign Up'
    expect(page).to have_link 'Sign Out'
    expect(page).to have_content 'All Groups'
  end

  scenario 'provides an email that is already in use' do
    existing_user = FactoryGirl.create(:user)

    visit '/'
    click_on 'Sign Up'
    fill_in 'First Name', with: user.first_name
    fill_in 'Last Name', with: user.last_name
    fill_in 'Email', with: existing_user.email
    fill_in 'Password', with: user.password
    fill_in 'Password Confirmation', with: user.password_confirmation
    fill_in 'Interests', with: user.interests
    click_on 'Sign me up!'

    expect(page).to have_content 'Email has already been taken'
    expect(page).to have_button 'Sign me up!'
  end

  scenario 'has missing attributes' do
    visit '/'
    click_on 'Sign Up'
    click_on 'Sign me up!'

    expect(page).to have_content "can't be blank"
    expect(page).to have_button 'Sign me up!'
  end

  scenario 'password confirmation does not match password' do
    visit '/'
    click_on 'Sign Up'
    fill_in 'First Name', with: user.first_name
    fill_in 'Last Name', with: user.last_name
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    fill_in 'Password Confirmation', with: 'abcdefgh'
    fill_in 'Interests', with: user.interests
    click_on 'Sign me up!'

    expect(page).to have_content "Password confirmation doesn't match Password"
    expect(page).to have_button 'Sign me up!'
  end

  scenario 'provides invalid email'
end
