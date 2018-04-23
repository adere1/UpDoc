Feature: find nearby pharmacies
  
  As a user
  So that I can find pharmacies near me
  I want to see a list of nearby pharmacies

Background: pharmacies have been added to database

  Given the following pharmacies exist:
  | name                    | street              | city        |
  | Ab Pharma               | Riverside Drive     | Binghamton  |
  | Jeff PHY                | East drive          | Vestal      |
  | University Pharmacy     | Vestal Parkway West | Binghamton  |
  
Scenario: default
  When I am on the home page
  Then I should see "Nearby Pharmacies"
  When I click on "Nearby Pharmacies"
  Then I should see "Ab Pharma"
  And I should see "Jeff PHY"
  And I should see "University Pharmacy"