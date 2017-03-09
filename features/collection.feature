Feature: Collection

 @automation
 Scenario: As a librarian,I can view Collection page
   Given I launch the SCSB application
    When I login with valid credentials
	 And I select Collection tab on the page
    Then I should see collection page with following elements:

   |elements					  |
   |search box                    |
   |Display records button        |
   |Note text                     |
   
 @automation
 Scenario: As a librarian,I can search with valid barcode in Collection page
   Given I launch the SCSB application
    When I login with valid credentials
	 And I select Collection tab on the page
    Then I should see collection UI page
	When I enter valid Barcode in collection search box
	 And I click Display Records
	Then I should see search results in collection UI page
	
  @automation
 Scenario: As a librarian,I can search with invalid barcode in Collection page
   Given I launch the SCSB application
    When I login with valid credential
	 And I select Collection tab on the page
    Then I should see collection UI page
	When I enter invalid 1234566789 barcode in collection search box
	 And I click Display Records
	Then I should see message "Barcode(s) not found"
	
 @automation
 Scenario: As a librarian,I can view search results elements when I search with valid barcode
   Given I launch the SCSB application
    When I login with valid credentials
	 And I select Collection tab on the page
    Then I should see collection UI page
	When I enter valid Barcode in collection search box
	 And I click Display Records
	Then I should see search results with following elements:
	|elements|
	|Barcode |
	|Title   |
	|CGD     |

 @automation
 Scenario: As a librarian,I can click title to navigate item detail page of the barcode
   Given I launch the SCSB application
    When I login with valid credentials
	 And I select Collection tab on the page
    Then I should see collection UI page
	When I enter valid Barcode in collection search box
	 And I click Display Records
	Then I should see search results in collection UI page
	When I click on the title 
	Then I should see item detail page with following elements
	|elements                 |
	|item details             |
	|Edit CGD radio Button    |
	|Deaccession radio button |
	|New CGD                  |
	|CGD Change Notes         |
	|Submit button            |
	
 @automation
 Scenario: As a librarian,I can edit CGD in item detail page
   Given I launch the SCSB application
    When I login with valid credentials
	 And I select Collection tab on the page
    Then I should see collection UI page
	When I enter valid Barcode in collection search box
	Then I should see search results in collection UI page
	When I click on the title 
	Then I should see item detail page 
	When I select edit CGD radio button
	 And I select New CGD
	 And I enter CGD change notes 
	 And I click submit
	Then I should see The CGD has been successfully updated
	When I search with same barcode in collection UI
	Then I should see updated CGD in the table view

 @automation
 Scenario: As a librarian,I cann't update CGD status without CGD change notes information
   Given I launch the SCSB application
    When I login with valid credentials
	 And I navigate to collection UI page
    Then I should see collection UI page
	When I navigate to item detail page
	 And I select edit CGD radio button
	 And I select new CGD
	 And I click submit
	Then I should see message Please enter CGD Change Notes
	
	
 @automation
 Scenario: As a librarian,I can view deaccession fields in item detail page
   Given I launch the SCSB application
    When I login with valid credentials
	 And I navigate to collection UI page
    Then I should see collection UI page
	When I navigate to item detail page
	 And I select deaccession radio button
	Then I should see item detail page with following elements
	|elements          |
	|Deaccession Type  |
	|Delivery Location |
	|Deaccession Notes |
	|Submit button     |
	
 @automation
 Scenario: As a librarian,I can deaccession the barcode through item detail page
   Given I launch the SCSB application
    When I login with valid credentials
	 And I navigate to collection UI page
    Then I should see collection UI page
	When I navigate to item detail page
	 And I select deaccession radio button
	 And I select delivery location
	 And I enter deaccession notes 
	 And I click submit
	Then I should see The item has been successfully deaccessioned
	When I serach with the same barcode in collection UI
	Then I should see message "Barcode(s) not found"
	
  @automation
 Scenario: As a librarian, when I deaccession the barcode, I can view delivery location in item detail page based on the customer code
   Given I launch the SCSB application
    When I login with valid credentials
	 And I navigate to collection UI page
    Then I should see collection UI page
	When I navigate to item detail page
	 And I select deaccession radio button
    Then I should see list of delivery location based on the customer code
	
 @automation
 Scenario: As a librarian, I cann't deaccession the barcode without select delivery location
   Given I launch the SCSB application
    When I login with valid credentials
	 And I navigate to collection UI page
    Then I should see collection UI page
	When I navigate to item detail page
	 And I select deaccession radio button
     And I enter deaccession notes 
	 And I click submit
	Then I should see error message "This is a mandatory field"
	
 @automation
 Scenario: As a librarian, I cann't deaccession the barcode without enter deaccession notes
   Given I launch the SCSB application
    When I login with valid credentials
	 And I navigate to collection UI page
    Then I should see collection UI page
	When I navigate to item detail page
	 And I select deaccession radio button
     And I select delivery location
	 And I click submit
	 Then I should see error message "Please enter Deaccession Notes"


