FactoryGirl.define do
	factory(:user) do
		email 'hemang2@gmail.com'
		password 'secret12'
		password_confirmation 'secret12'
	end
end