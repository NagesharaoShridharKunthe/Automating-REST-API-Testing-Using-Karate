Feature: updating(put) user deatails

  Background:
    * def token = 'bc58c41bd681fdc1a355d261e04679e6c018538e3b9cc1d2a37b34aa006e4245'
    Given url 'https://gorest.co.in/public/v1/'
    Given header Content-Type = 'application/json'
    And header Authorization = 'Bearer ' + token

  Scenario: change with a valid name
    Given path 'users/7451972'
    And request
      """
      {
        "name":"Pruthvi"
      }
      """
    When method put
    Then status 200
    And match response.data.name == "Pruthvi"

  Scenario: change with a valid email
    Given path 'users/7451967'
    And request
      """
      {
        "email":"pruthvi@gmail.com"
      }
      """
    When method put
    Then status 200
    And match response.data.email == "pruthvi@gmail.com"

  Scenario: change with a valid gender
    Given path 'users/7451965'
    And request
      """
      {
        "gender":"female"
      }
      """
    When method put
    Then status 200
    And match response.data.gender == "female"

  Scenario: change with a valid status
    Given path 'users/7451962'
    And request
      """
      {
        "status":"inactive"
      }
      """
    When method put
    Then status 200
    And match response.data.status == "inactive"

  Scenario: change with a invalid name(giving number is name)
    Given path 'users/7451972'
    And request
      """
      {
        "name":"1234"
      }
      """
    When method put
    Then status 422

  Scenario: change with a invalid email
    Given path 'users/7451967'
    And request
      """
      {
        "email":"pruthvi@.com"
      }
      """
    When method put
    Then status 422

  Scenario: change with a invalid gender
    Given path 'users/7451965'
    And request
      """
      {
        "gender":"f"
      }
      """
    When method put
    Then status 422

  Scenario: change with a invalid status
    Given path 'users/7451962'
    And request
      """
      {
        "status":"i"
      }
      """
    When method put
    Then status 422