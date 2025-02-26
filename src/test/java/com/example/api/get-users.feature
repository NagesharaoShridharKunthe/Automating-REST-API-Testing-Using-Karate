Feature: geting user details

  Background:
    * def token = 'bc58c41bd681fdc1a355d261e04679e6c018538e3b9cc1d2a37b34aa006e4245'
    * url 'https://gorest.co.in/public/v1/'
    * header Content-Type = 'application/json'
    * header Authorization = 'Bearer ' + token

  Scenario: Retrieving details of all the users at a time
    Given path 'users'
    When method GET
    Then status 200

  Scenario: Retrieving details of a single/valid user
    Given path 'users/7472025'
    When method GET
    Then status 200
#    And match response.data.name == "Advaya Kaul"

  Scenario: Retriving details of a invalid user
    Given path 'users/1234'
    When method GET
    Then status 404
