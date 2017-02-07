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
 Scenario: As a Search and Request User,I should have the following permissions
    Given I launch the SCSB application
     When I login with valid Search and Request user credentials
     Then I should see the following permissions:
     |permissions                                        |
     |requests-owninstitution-Shared Open or Private     |
     |requests-regardless of Inst-shared or open         |
     |cancel own requests                                |
     |view/print reports                                 |
     |search SCSB and export results                     |


 @automation
 Scenario: As a Collections User,I should have the following permissions
    Given I launch the SCSB application
     When I login with valid Collections user credentials
     Then I should see the following permissions:
     |permissions                                        |
     |write/edit CGD for own institution                 |
     |deaccession records for own institution            |
     |requests - own institution -Shared Open or Private |
     |requests - regardless of Inst - shared or open     |
     |cancel_own_requests                                |
     |view/print reports                                 |
     |search SCSB and export results                     |


 @automation
 Scenario: As a ReCAP User,I should have the following permissions
    Given I launch the SCSB application
     When I login with valid ReCap user credentials
     Then I should see the following permissions:

     |permissions                                        |
     |requests - own institution -Shared,Open or Private |
     |requests - regardless of Inst - shared or open     |
     |view/print reports                                 |
     |search SCSB and export results                     |
     |Restriction to view barcode number in SCSB search  |
     |request items from any institution                 |
     |cancel any request                                 |

 @automation
 Scenario: As a super admin User, I should have the following permissions
    Given I launch the SCSB application
     When I login with valid superadmin user credentials
     Then I should see the following permissions:
     |permissions                                              |
     |requests - regardless of Inst - shared,open and Private  |
     |view/print reports                                       |
     |search SCSB and export results                           |
     |request items from any institution                       |
     |cancel any request                                       |
     |write/edit CGD for own institution                       |
     |deaccession records for own institution                  |

