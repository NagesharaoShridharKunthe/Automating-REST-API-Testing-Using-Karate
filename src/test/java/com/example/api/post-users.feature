Feature: Create a new user

  Background:
    * def token = 'bc58c41bd681fdc1a355d261e04679e6c018538e3b9cc1d2a37b34aa006e4245'
    * def baseUrl = 'https://gorest.co.in/public/v1/users'
    Given header Content-Type = 'application/json'
    And header Authorization = 'Bearer ' + token

  Scenario: All the credentials are valid(valid name, email, gender, status)
    And url baseUrl
    And request
      """
      {
        "name":"Nagesha",
        "email":"nagesh@gmail.com",
        "gender":"male",
        "status":"active"
      }
      """
    When method post
    Then status 201

  Scenario: Valid email, gender, status but invalid name(Giving number and character as input)
    And url baseUrl
    And request
      """
      {
        "name":"1234$%",
        "email":"nagesha@gmail.com",
        "gender":"male",
        "status":"active"
      }
      """
    When method post
    Then status 422

  Scenario: Valid name, gender, status but invalid email(email without @example)
    And url baseUrl
    And request
      """
      {
        "name":"Nagesha",
        "email":"nagesha.com",
        "gender":"male",
        "status":"active"
      }
      """
    When method post
    Then status 422

  Scenario: Valid name, gender, status but invalid email(email without TLD(top-level domain ) Example:-net, .org, .info, .com)
    And url baseUrl
    And request
      """
      {
        "name":"Nagesha",
        "email":"nagesha@gmail",
        "gender":"male",
        "status":"active"
      }
      """
    When method post
    Then status 422

  Scenario: Valid name, gender, status but invalid email(email without name ex:- @example.com)
    And url baseUrl
    And request
      """
      {
        "name":"Nagesha",
        "email":"@gmail.com",
        "gender":"male",
        "status":"active"
      }
      """
    When method post
    Then status 422

  Scenario: Valid name, email, status but Gender field is empty
    And url baseUrl
    And request
      """
      {
        "name":"Nagesha",
        "email":"nagesha@gmail.com",
        "gender":"",
        "status":"active"
      }
      """
    When method post
    Then status 422

  Scenario: Checking if the gender field is case sensitive
    And url baseUrl
    And request
      """
      {
        "name":"Nagesha",
        "email":"nagsha@gmail.com",
        "gender":"Male",
        "status":"active"
      }
      """
    When method post
    Then status 201

  Scenario: Checking if it can validate more than one field at the same time(Example giving invalid gender and email)
    And url baseUrl
    And request
      """
      {
        "name":"Nagesha",
        "email":"nagesha.com",
        "gender":"M",
        "status":"active"
      }
      """
    When method post
    Then status 422

  Scenario: Valid name, email, gender but invalid status(Status other than active and inactive is given)
    And url baseUrl
    And request
      """
      {
        "name":"Nagesha",
        "email":"nagesha@gmail.com",
        "gender":"male",
        "status":"A"
      }
      """
    When method post
    Then status 422

  Scenario: Valid email, gender, status but name field is blank
    And url baseUrl
    And request
      """
      {
        "name":"",
        "email":"nagesha@gmail.com",
        "gender":"male",
        "status":"active"
      }
      """
    When method post
    Then status 422

  Scenario: Valid name, gender, status but email filed is blank
    And url baseUrl
    And request
      """
      {
        "name":"Nagesha",
        "email":"",
        "gender":"male",
        "status":"active"
      }
      """
    When method post
    Then status 422

  Scenario: Valid name, email, gender but status filed is empty
    And url baseUrl
    And request
      """
      {
        "name":"Nagesha",
        "email":"nagesha@gmail.com",
        "gender":"male",
        "status":""
      }
      """
    When method post
    Then status 422

