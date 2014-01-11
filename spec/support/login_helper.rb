module LoginHelper
  def login(user)
    visit '/'
    click_on 'Sign Up'
    fill_in 'First Name', with: user.first_name
    fill_in 'Last Name', with: user.last_name
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    fill_in 'Password Confirmation', with: user.password_confirmation
    fill_in 'Interests', with: user.interests
    click_on 'Sign me up!'
  end
end
