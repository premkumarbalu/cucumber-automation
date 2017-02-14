Feature: Request

  @automation
  Scenario: As a librarian, I can see mandatory fields error message in request page
    Given I launch the SCSB application
     When I login with valid credentials
      And I navigate to request page
      And I click create button
     Then I should see mandatory fields error messages:
      |mandatory fields error_msg         |
      |Item barcode is required.          |
      |Patron barcode is required.        |
      |Requesting institution is required.|
      |Delivery location is required.     |

  @automation
  Scenario: As a librarian, I can create own institution PUL to PUL request
    Given I launch the SCSB application
     When I login with valid credentials
      And I navigate to request page
      And I enter own institution PUL to PUL mandaory information in request page
      And I click create
     Then I should see request details in request page

  @automation
  Scenario: As a librarian, I can create cross institution PUL to CUL request
    Given I launch the SCSB application
     When I login with valid credentials
      And I navigate to request page
      And I enter cross institution PUL to CUL mandaory information in request page
      And I click create button
     Then I should see request details in request page


  @automation
  Scenario: As a librarian, I can create cross institution PUL to NYPL request
    Given I launch the SCSB application
     When I login with valid credentials
      And I navigate to request page
      And I enter cross institution PUL to NYPL mandaory information in request page
      And I click create button
     Then I should see request details in request page

    #CUL
  @automation
  Scenario: As a librarian, I can create own institution CUL to CUL request
    Given I launch the SCSB application
     When I login with valid credentials
      And I navigate to request page
      And I enter cross institution CUL to CUL mandaory information in request page
      And I click create button
     Then I should see request details in request page


  @automation
  Scenario: As a librarian, I can create cross institution CUL to PUL request
    Given I launch the SCSB application
     When I login with valid credentials
      And I navigate to request page
      And I enter cross institution CUL to PUL mandaory information in request page
      And I click create button
     Then I should see request details in request page


  @automation
  Scenario: As a librarian, I can create cross institution CUL to NYPL request
    Given I launch the SCSB application
     When I login with valid credentials
      And I navigate to request page
      And I enter cross institution CUL to NYPL mandaory information in request page
      And I click create button
     Then I should see request details in request page

  #NYPL
  @automation
  Scenario: As a librarian, I can create own institution NYPL to NYPL request
    Given I launch the SCSB application
     When I login with valid credentials
      And I navigate to request page
      And I enter cross institution NYPL to NYPL mandaory information in request page
      And I click create button
     Then I should see request details in request page


  @automation
  Scenario: As a librarian, I can create cross institution NYPL to PUL request
    Given I launch the SCSB application
     When I login with valid credentials
      And I navigate to request page
      And I enter cross institution NYPL to PUL mandaory information in request page
      And I click create button
     Then I should see request details in request page


  @automation
  Scenario: As a librarian, I can create cross institution NYPL to CUL request
    Given I launch the SCSB application
     When I login with valid credentials
      And I navigate to request page
      And I enter cross institution NYPL to CUL mandaory information in request page
      And I click create button
     Then I should see request details in request page