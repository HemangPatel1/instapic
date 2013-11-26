When(/^I fill in the form correctly$/) do
  fill_in('user_email', :with => 'hemang2@gmail.com')
  fill_in('user_password', :with => 'secret12')
  fill_in('user_password_confirmation', :with => 'secret12')
  click_button 'Sign up'
end


When(/^I fill in the form incorrectly$/) do
  fill_in('user_email', :with => 'hemang2@gmail.com')
  fill_in('user_password', :with => 'secret')
  fill_in('user_password_confirmation', :with => 'secret')
  click_button 'Sign up'
end
