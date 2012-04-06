Feature: login and create new topic

Scenario: 
	Given that I am on page "HOMEPAGE"
	When I click on link href "./viewforum.php?f=2"
	Then I should see text "Your first forum"
	And I wait 2 seconds
	When I click on link href "./posting.php?mode=post&f=2"
	And I wait 5 seconds
	Then I enter text "admin" to the "username" field 
	Then I enter text "123456" to the "password" field 
	When I click the Login  button
	Then I should see text "You have"
	And I wait 5 seconds
	Then I enter text "subject 1" to the "subject" field
	Then I enter text "message from testing" to the "message" field
	And I wait 5 seconds
	When I click the button name "post"
	And I wait 5 seconds
	
Scenario: display topics
	Given that I am on page "HOMEPAGE"
	When I click on link href "./viewforum.php?f=2"
	Then I should see text "Your first forum"
	And I wait 2 seconds