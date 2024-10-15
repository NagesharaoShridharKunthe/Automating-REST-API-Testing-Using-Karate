Feature: updating(put) user details

  Background:
    * def token = 'bc58c41bd681fdc1a355d261e04679e6c018538e3b9cc1d2a37b34aa006e4245'
    * url 'https://gorest.co.in/public/v1/'
    * header Content-Type = 'application/json'
    * header Authorization = 'Bearer ' + token

  Scenario: change with a valid name
    Given path 'users/7471984'
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
    Given path 'users/7471666'
    And request
      """
      {
        "email":"pruthvi100@gmail.com"
      }
      """
    When method put
    Then status 200
    And match response.data.email == "pruthvi@gmail.com"

  Scenario: change with a valid gender
    Given path 'users/7471988'
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
    Given path 'users/7471670'
    And request
      """
      {
        "status":"inactive"
      }
      """
    When method put
    Then status 200
    And match response.data.status == "inactive"

  Scenario: change with a invalid gender
    Given path 'users/7471980'
    And request
      """
      {
        "gender":"f"
      }
      """
    When method put
    Then status 422

  Scenario: change with a invalid status
    Given path 'users/7471979'
    And request
      """
      {
        "status":"i"
      }
      """
    When method put
    Then status 422
