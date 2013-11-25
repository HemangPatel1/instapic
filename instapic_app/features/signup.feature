Feature: Signing Up
	In order to use Instapic
	As a user who wants to be amazed by pictures
	I want to be able to sign up

	Scenario: Signing Up
			Given I am on the homepage
			And I follow "Sign Up"
			Then I should see "Create Your Instapic Account"
			