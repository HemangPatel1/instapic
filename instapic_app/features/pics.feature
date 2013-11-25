Feature: Viewing pics
	In order to view pics people have posted
	As a user who likes seeing pics
	I want to view the pics all others have posted


	Scenario: Posting a pic if signed in
		Given I am signed in
		And I am on the new pics page
		And I have shared the following pics:
			| pic_caption	|
			| Banana-ing	|
		Then I should see "Banana-ing"


	# Scenario: Pics must have the username of the user who shared it
	# 	Given I am signed in
	# 	And I have shared the pics:
	# 		| pic_caption		| username		|
	# 		| Banana-ing it up!	| HemangularJS	|
	# 	Then I should see "Banana-ing it up!"
	# 	And I should see "Hemangle"	