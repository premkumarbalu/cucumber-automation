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
  Scenario: As a librarian, I can create own institution PUL to PUL RETRIEVAL request
    Given I launch the SCSB application
     When I login with valid credentials
      And I navigate to request page
      And I enter own institution PUL to PUL mandaory information for RETRIEVAL request
      And I click create
     Then I should see request details in request page

  @automation
  Scenario: As a librarian, I can create cross institution PUL to CUL RETRIEVAL request
    Given I launch the SCSB application
     When I login with valid credentials
      And I navigate to request page
      And I enter cross institution PUL to CUL mandaory information for RETRIEVAL request
      And I click create
     Then I should see request details in request page


  @automation
  Scenario: As a librarian, I can create cross institution PUL to NYPL RETRIEVAL request
    Given I launch the SCSB application
     When I login with valid credentials
      And I navigate to request page
      And I enter cross institution PUL to NYPL mandaory information for RETRIEVAL request
      And I click create
     Then I should see request details in request page

    #CUL
  @automation
  Scenario: As a librarian, I can create own institution CUL to CUL RETRIEVAL request
    Given I launch the SCSB application
     When I login with valid credentials
      And I navigate to request page
      And I enter cross institution CUL to CUL mandaory information for RETRIEVAL request
      And I click create
     Then I should see request details in request page


  @automation
  Scenario: As a librarian, I can create cross institution CUL to PUL RETRIEVAL request
    Given I launch the SCSB application
     When I login with valid credentials
      And I navigate to request page
      And I enter cross institution CUL to PUL mandaory information for RETRIEVAL request
      And I click create
     Then I should see request details in request page


  @automation
  Scenario: As a librarian, I can create cross institution CUL to NYPL RETRIEVAL request
    Given I launch the SCSB application
     When I login with valid credentials
      And I navigate to request page
      And I enter cross institution CUL to NYPL mandaory information for RETRIEVAL request
      And I click create
     Then I should see request details in request page

  #NYPL
  @automation
  Scenario: As a librarian, I can create own institution NYPL to NYPL RETRIEVAL request
    Given I launch the SCSB application
     When I login with valid credentials
      And I navigate to request page
      And I enter cross institution NYPL to NYPL mandaory information for RETRIEVAL request
      And I click create
     Then I should see request details in request page


  @automation
  Scenario: As a librarian, I can create cross institution NYPL to PUL RETRIEVAL request
    Given I launch the SCSB application
     When I login with valid credentials
      And I navigate to request page
      And I enter cross institution NYPL to PUL mandaory information for RETRIEVAL request
      And I click create
     Then I should see request details in request page


  @automation
  Scenario: As a librarian, I can create cross institution NYPL to CUL RETRIEVAL request
    Given I launch the SCSB application
     When I login with valid credentials
      And I navigate to request page
      And I enter cross institution NYPL to CUL mandaory information for RETRIEVAL request
      And I click create
     Then I should see request details in request page

  @automation
  Scenario: As a librarian, I can create own institution PUL to PUL EDD request
    Given I launch the SCSB application
     When I login with valid credentials
      And I navigate to request page
      And I enter own institution PUL to PUL mandaory information for EDD request
      And I click create
     Then I should see request details in request page

  @automation
  Scenario: As a librarian, I can create cross institution PUL to CUL EDD request
    Given I launch the SCSB application
     When I login with valid credentials
      And I navigate to request page
      And I enter cross institution PUL to CUL mandaory information for EDD request
      And I click create
     Then I should see request details in request page


  @automation
  Scenario: As a librarian, I can create cross institution PUL to NYPL EDD request
    Given I launch the SCSB application
     When I login with valid credentials
      And I navigate to request page
      And I enter cross institution PUL to NYPL mandaory information for EDD request
      And I click create
     Then I should see request details in request page

    #CUL
  @automation
  Scenario: As a librarian, I can create own institution CUL to CUL EDD request
    Given I launch the SCSB application
     When I login with valid credentials
      And I navigate to request page
      And I enter cross institution CUL to CUL mandaory information for EDD request
      And I click create
     Then I should see request details in request page


  @automation
  Scenario: As a librarian, I can create cross institution CUL to PUL EDD request
    Given I launch the SCSB application
     When I login with valid credentials
      And I navigate to request page
      And I enter cross institution CUL to PUL mandaory information for EDD request
      And I click create
     Then I should see request details in request page


  @automation
  Scenario: As a librarian, I can create cross institution CUL to NYPL EDD request
    Given I launch the SCSB application
     When I login with valid credentials
      And I navigate to request page
      And I enter cross institution CUL to NYPL mandaory information for EDD request
      And I click create
     Then I should see request details in request page


  @automation
  Scenario: As a librarian, I can create own institution NYPL to NYPL EDD request
    Given I launch the SCSB application
     When I login with valid credentials
      And I navigate to request page
      And I enter cross institution NYPL to NYPL mandaory information for EDD request
      And I click create
     Then I should see request details in request page


  @automation
  Scenario: As a librarian, I can create cross institution NYPL to PUL EDD request
    Given I launch the SCSB application
     When I login with valid credentials
      And I navigate to request page
      And I enter cross institution NYPL to PUL mandaory information for EDD request
      And I click create
     Then I should see request details in request page


  @automation
  Scenario: As a librarian, I can create cross institution NYPL to CUL EDD request
    Given I launch the SCSB application
     When I login with valid credentials
      And I navigate to request page
      And I enter cross institution NYPL to CUL mandaory information for EDD request
      And I click create
     Then I should see request details in request page

  @automation
  Scenario: As a librarian, I can cancel RETREVAL request
    Given I launch the SCSB application
     When I login with valid credentials
      And I navigate to request page
      And I search RETRIVAL request
      And I click cancel button
     #Then I should see cancelled item barcode in available in search page

  @automation
  Scenario: As a librarian, I can create own institution PUL to PUL RECALL request
    Given I launch the SCSB application
    When I login with valid credentials
    And I navigate to request page
    And I enter own institution PUL to PUL mandaory information for RECALL request
    And I click create
    Then I should see request details in request page

  @automation
  Scenario: As a librarian, I can create cross institution PUL to CUL RECALL request
    Given I launch the SCSB application
    When I login with valid credentials
    And I navigate to request page
    And I enter cross institution PUL to CUL mandaory information for RECALL request
    And I click create
    Then I should see request details in request page


  @automation
  Scenario: As a librarian, I can create cross institution PUL to NYPL RECALL request
    Given I launch the SCSB application
    When I login with valid credentials
    And I navigate to request page
    And I enter cross institution PUL to NYPL mandaory information for RECALL request
    And I click create
    Then I should see request details in request page

    #CUL
  @automation
  Scenario: As a librarian, I can create own institution CUL to CUL RECALL request
    Given I launch the SCSB application
    When I login with valid credentials
    And I navigate to request page
    And I enter cross institution CUL to CUL mandaory information for RECALL request
    And I click create
    Then I should see request details in request page


  @automation
  Scenario: As a librarian, I can create cross institution CUL to PUL RECALL request
    Given I launch the SCSB application
    When I login with valid credentials
    And I navigate to request page
    And I enter cross institution CUL to PUL mandaory information for RECALL request
    And I click create
    Then I should see request details in request page


  @automation
  Scenario: As a librarian, I can create cross institution CUL to NYPL RECALL request
    Given I launch the SCSB application
    When I login with valid credentials
    And I navigate to request page
    And I enter cross institution CUL to NYPL mandaory information for RECALL request
    And I click create
    Then I should see request details in request page


  @automation
  Scenario: As a librarian, I can create own institution NYPL to NYPL RECALL request
    Given I launch the SCSB application
    When I login with valid credentials
    And I navigate to request page
    And I enter cross institution NYPL to NYPL mandaory information for RECALL request
    And I click create
    Then I should see request details in request page


  @automation
  Scenario: As a librarian, I can create cross institution NYPL to PUL RECALL request
    Given I launch the SCSB application
    When I login with valid credentials
    And I navigate to request page
    And I enter cross institution NYPL to PUL mandaory information for RECALL request
    And I click create
    Then I should see request details in request page


  @automation
  Scenario: As a librarian, I can create cross institution NYPL to CUL RECALL request
    Given I launch the SCSB application
    When I login with valid credentials
    And I navigate to request page
    And I enter cross institution NYPL to CUL mandaory information for RECALL request
    And I click create
    Then I should see request details in request page