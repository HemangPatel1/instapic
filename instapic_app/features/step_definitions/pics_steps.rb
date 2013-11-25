Given(/^I am signed in$/) do
  create(:user)
  visit '/users/sign_in'
  fill_in('user_email', :with => 'hemang2@gmail.com')
  fill_in('user_password', :with => 'secret12')
  click_button 'Sign in'
end

Given(/^I have shared the following pics:$/) do |pics|
	pics.hashes.each do |pic|
    	fill_in(:pic_caption, :with => pic['pic_caption'])
		click_button 'Share'
  	end
end