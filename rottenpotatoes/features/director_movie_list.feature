Feature: search for movies by director

  As a movie buff
  So that I can find movies with my favorite director
  I want to include and serach on director information in movies I enter

Background: movies in database

  Given the following movies exist:
  | title        | rating | director     | release_date |
  | Star Wars    | PG     | George Lucas |   1977-05-25 |
  | Blade Runner | PG     | Ridley Scott |   1982-06-25 |
  | Alien        | R      |              |   1979-05-25 |
  | THX-1138     | R      | George Lucas |   1971-03-11 |
  | Death        | R      |              |   2079-05-25 |
  | Shaolin      | R      | Jackie Li    |   1980-01-01 |
  | Shaolin2     | R      | Jackie Li    |   1983-01-01 |
  | Shaolin3     | R      | Jackie Li    |   1985-01-01 |

Scenario: add director to existing movie
  When I go to the edit page for "Alien"
  And  I fill in "Director" with "Ridley Scott"
  And  I press "Update Movie Info"
  Then the director of "Alien" should be "Ridley Scott"
  
Scenario: add director to existing movie2
  When I go to the edit page for "Death"
  And  I fill in "Director" with "Alan yang"
  And  I press "Update Movie Info"
  Then the director of "Death" should be "Alan yang"

Scenario: find movie with same director
  Given I am on the details page for "Shaolin"
  When  I follow "Find Movies With Same Director"
  Then  I should be on the Similar Movies page for "Shaolin"
  And   I should see "Shaolin2"
  And   I should see "Shaolin3"
  But   I should not see "Death"

Scenario: find movie with same director2
  Given I am on the details page for "Star Wars"
  When  I follow "Find Movies With Same Director"
  Then  I should be on the Similar Movies page for "Star Wars"
  And   I should see "THX-1138"
  But   I should not see "Blade Runner"

Scenario: can't find similar movies if we don't know director (sad path)
  Given I am on the details page for "Death"
  Then  I should not see "Ridley Scott"
  When  I follow "Find Movies With Same Director"
  Then  I should be on the home page
  And   I should see "'Death' has no director info"

  Scenario: can't find similar movies if we don't know director (sad path)2
  Given I am on the details page for "Alien"
  Then  I should not see "Ridley Scott"
