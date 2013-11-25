Feature: Login
	In order to use Instapic
	As a user who wants to has signed up
	I want to be able to login

	Scenario: Logging In
			Given I am on the homepage
			And I follow "Login"
			Then I should see "Login"
			
	Scenario: Logging In correctly
			Given I am on the login page
			When I fill in the login form correctly
			Then I should see "Signed in successfully."