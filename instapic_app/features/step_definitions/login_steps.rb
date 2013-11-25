When(/^I fill in the login form correctly$/) do
  create(:user)
  fill_in('user_email', :with => 'hemang2@gmail.com')
  fill_in('user_password', :with => 'secret12')
  click_button 'Sign in'
end

When(/^I fill in the login form incorrectly$/) do
  create(:user)
  fill_in('user_email', :with => 'hemang2@gmail.com')
  fill_in('user_password', :with => 'secret13')
  click_button 'Sign in'
end