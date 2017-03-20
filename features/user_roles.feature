Feature: User Management & Roles permissions

 @automation
 Scenario Outline: As a library admin,I can create users and give others any role for own institution only
   Given I launch the SCSB application
    When I login with valid credentials
	 And I create new user with following "<roles>" for own institution only:
    Then I should see message user has been Added Successfully

 Examples:
	 |roles          |
     |Admin          |
	 |SearchRequest  |
	 |Collections    |
	 |ReCAP          |
	 |Search         |


 @automation
 Scenario: As a admin user i can create "Search and Request" User
   Given I launch the SCSB application
    When I login with valid credentails
    Then I can create Search and Request user credentials


 @automation
 Scenario: As a admin user i can create "Collections" User
   Given I launch the SCSB application
    When I login with valid credentails
    Then I can create Collections user credentials


 @automation
 Scenario: As a admin user i can create "ReCAP" User
   Given I launch the SCSB application
    When I login with valid credentails
    Then I can create ReCAP user credentials

 @automation
 Scenario: As a admin user i can create "admin" User
   Given I launch the SCSB application
    When I login with valid credentails
    Then I can create admin user credentials


