FactoryGirl.define do
	factory(:user) do
		email 'hemang2@gmail.com'
		password 'secret12'
		password_confirmation 'secret12'
	end

	factory(:signed_up_user, class: User) do
		email 'hemang2@gmail.com'
		password 'secret13'
		password_confirmation 'secret13'
	end

	factory(:logged_in_user, class: User) do
		email 'hemang2@gmail.com'
		password 'secret13'
	end
end