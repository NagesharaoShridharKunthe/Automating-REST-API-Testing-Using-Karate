Feature: updating(put) user details

  Background:
    * def token = 'bc58c41bd681fdc1a355d261e04679e6c018538e3b9cc1d2a37b34aa006e4245'
    * url 'https://gorest.co.in/public/v1/'
    * header Content-Type = 'application/json'
    * header Authorization = 'Bearer ' + token

  Scenario: Delete the user with a valid ID
    Given path 'users/7471657'
    When method DELETE
    Then status 204

  Scenario: Testing if the user still exists
    Given path 'users/7471657'
    When method GET
    Then status 404

  Scenario: Delete the user who has been already been deleted(Deleting the user more than once)
    Given path 'users/7471657'
    When method DELETE
    Then status 404

  Scenario: Delete the user with a invalid ID
    Given path 'users/1234'
    When method DELETE
    Then status 404
