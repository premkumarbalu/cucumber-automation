# Author: HTC
# Story: Search Result
# Date Signed Off:
# Scenario Count :26
# Notes


Feature: Search page

 @automation
 Scenario: As a librarian,I can view search page
  Given I launch the SCSB application
  When I login with valid credentails
  Then I should see search page with following elements:

   |elements					   |
   |search box                    |
   |Owning instituation checkboxes|
   |Colloction group checkboxs    |
   |Avaliability checkbox         |
   |material type checkboxs       |
   |All fields dropdown           |
   |Search button                 |
   |clear button                  |
   |New Search button             |

 @manual
 Scenario: As a librarian, I can see checkbox filters are checked by defaultly in search page
  Given I launch the SCSB application
  When I login with valid credential
  Then I should see the following checkbox filters are checked by defaultly:

   |filters                       |
   |Owning instituation checkboxes|
   |Colloction group checkboxs    |
   |Avaliability checkbox         |
   |material type checkboxs       |

 @automation
 Scenario: As a librarian, I can see "All fields" details in search page
  Given I launch the SCSB application
  When I login with valid credential
  And I select All fields drop down
  Then I could see the following elements in all fields dropdown box:

   |All fields       |
   |Author           |
   |Title            |
   |Title Starts with|
   |Publisher        |
   |Publication Place|
   |Publication Date |
   |Subject          |
   |ISBN             |
   |ISSN             |
   |OCLC Number      |
   |Notes            |
   |Call Number      |
   |Barcode          |

 @automation
 Scenario: As a librarian, I can search with "Author" name as a keyword in the search box
  Given I launch the SCSB application
  When I login with valid credential
  And I enter "Ellis, Myriam." in search box
  And I select "Author" in All fields dropdown box
  And I click search button
  Then I should see the search results

 @automation
 Scenario: As a librarian, I can search with "Title" as a keyword in the search box
  Given I launch the SCSB application
  When I login with valid credential
  And I enter "Russko-novogrecheskiĭ slovarʹ." in search box
  And I select "Title" in All fields dropdown box
  And I click search button
  Then I should see the search results

 @automation
 Scenario: As a librarian, I can search with "Title start with" as a keyword in the search box
  Given I launch the SCSB application
  When I login with valid credential
  And I enter "Russko" in search box
  And I select "Title Starts with" in All fields dropdown box
  And I click search button
  Then I should see the search results

 @automation
 Scenario: As a librarian, I can search with "Publisher" as a keyword in the search box
  Given I launch the SCSB application
  When I login with valid credential
  And I enter "The Unionist-gazette association," in search box
  And I select "Publisher" in All fields dropdown box
  And I click search button
  Then I should see the search results

 @automation
 Scenario: As a librarian, I can search with "Publication Place" as a keyword in the search box
  Given I launch the SCSB application
  When I login with valid credential
  And I enter "Washington" in search box
  And I select "Publication Place" in All fields dropdown box
  And I click search button
  Then I should see the search results

 @automation
 Scenario: As a librarian, I can search with "Publication Date" as a keyword in the search box
  Given I launch the SCSB application
  When I login with valid credential
  And I enter "1982" in search box
  And I select "Publication Date" in All fields dropdown box
  And I click search button
  Then I should see the search results

 @automation
 Scenario: As a librarian, I can search with "Subject" as a keyword in the search box
  Given I launch the SCSB application
  When I login with valid credential
  And I enter "Inland navigation Balkan Peninsula." in search box
  And I select "Subject" in All fields dropdown box
  And I click search button
  Then I should see the search results

 @automation
 Scenario: As a librarian, I can search with "ISBN" as a keyword in the search box
  Given I launch the SCSB application
  When I login with valid credential
  And I enter "3500261809" in search box
  And I select "ISBN" in All fields dropdown box
  And I click search button
  Then I should see the search results

 @automation
 Scenario: As a librarian, I can search with "ISSN" as a keyword in the search box
  Given I launch the SCSB application
  When I login with valid credential
  And I enter "0735-4207" in search box
  And I select "ISSN" in All fields dropdown box
  And I click search button
  Then I should see the search results

 @automation
 Scenario: As a librarian, I can search with "OCLC Number" as a keyword in the search box
  Given I launch the SCSB application
  When I login with valid credential
  And I enter "08009499" in search box
  And I select "OCLC Number" in All fields dropdown box
  And I click search button
  Then I should see the search results

 @automation
 Scenario: As a librarian, I can search with "Notes" as a keyword in the search box
  Given I launch the SCSB application
  When I login with valid credential
  And I enter "A novel. Dedication signed: Georgina Alicia L.̲̲̲̲̲̲" in search box
  And I select "Notes" in All fields dropdown box
  And I click search button
  Then I should see the search results

 @automation
 Scenario: As a librarian, I can search with "Call Number" as a keyword in the search box
  Given I launch the SCSB application
  When I login with valid credential
  And I enter "AE59.E54 1900z" in search box
  And I select "Call Number" in All fields dropdown box
  And I click search button
  Then I should see the search results

 @automation
 Scenario: As a librarian, I can search with "Barcode" as a keyword in the search box
  Given I launch the SCSB application
  When I login with valid credential
  And I enter "32101088253909" in search box
  And I select "Barcode" in All fields dropdown box
  And I click search button
  Then I should see the search results

 @automation
 Scenario: As a librarian, I can search with valid keyword , application should display the search result with two buttons
  Given I launch the SCSB application
  When I login with valid credential
  And I enter "Lazarovich-Hrebelianovich" in search box
  And I select "Author" in All fields dropdown box
  And I click search button
  Then I should see the search results
  And I should see the following buttons:

   |Button                  |
   |Request Selected Records|
   |Export Selected Records |

 @manual
 Scenario: As a librarian, I can clear content in the text field and checkboxes
  Given I launch the SCSB application
  When I login with valid credential
  And I click clear button
  Then I should see content cleared in the search text field
  And I should see all checkboxe filters are checked by default

 @manual
 Scenario: As a librarian, I can reset search page
  Given I launch the SCSB application
  When I login with valid credential
  And I click "New Search" button
  Then I should see default search page

 @manual
 Scenario: As a librarian, I can request selected records in search page
  Given I launch the SCSB application
  When I login with valid credential
  And I search with valid keyword in search box
  Then I Should see search results in application
  When I select "Request Selected Records"
  Then I should navigate new tab with create request with the barcode auto populated is open

 @manual
 Scenario: As a librarian, I can export selected records in search page
  Given I launch the SCSB application
  When I login with valid credential
  And I search with valid keyword in search box
  Then I Should see search results in application
  When I select "Export Selected Records"
  Then The selected records are exported as a CSV file in the same format as the grid

 @automation
 Scenario: As a librarian, I search with invalid keyword or junk keyword
  Given I launch the SCSB application
  When I login with valid credential
  And I search with invalid keyword in search box
  Then I should see error message as "No search results found. Please refine search conditions."

 @automation
 Scenario: As a librarian, I can view bib record detail page
  Given I launch the SCSB application
  When I login with valid credential
  And I click search button
  Then I should see the search results
  When I select tital of bib record randomly
  Then I should navigate bib record detail page

 @automation
 Scenario: As a librarian, I can verify total of the bib records in search results
   Given I launch the SCSB application
    When I login with valid credential
     And I click search button
    Then I should see cocunt of the bib records
    When I select each institution records count
    Then I should match with total count of bib records

 @manual
 Scenario: As a librarian, I can verify title sorting functionality
   Given I launch the SCSB application
    When I login with valid credential
     And I click search button
    Then I should see the search results
    When I click title sorting arrow
    Then I should see title sorted based on the alphabets

 @manual
 Scenario: As a librarian, I can verify author sorting functionality
   Given I launch the SCSB application
    When I login with valid credential
     And I click search button
    Then I should see the search results
    When I click author sorting arrow
    Then I should see author sorted based on the alphabets