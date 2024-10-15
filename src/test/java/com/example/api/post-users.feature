Feature: Create a new user

  Background:
    * def token = 'bc58c41bd681fdc1a355d261e04679e6c018538e3b9cc1d2a37b34aa006e4245'
    * def baseUrl = 'https://gorest.co.in/public/v1/users'
    * header Content-Type = 'application/json'
    * header Authorization = 'Bearer ' + token

  Scenario: All the credentials are valid(valid name, email, gender, status)
    And url baseUrl
    And request
      """
      {
        "name":"Nagesh",
        "email":"nagesha1@gmail.com",
        "gender":"male",
        "status":"active"
      }
      """
    When method post
    Then status 201
    And match response.data.name == "Nagesha"
    And match response.data.email == "nagesh1@gmail.com"
    And match response.data.gender == "male"
    And match response.data.status == "active"


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
    And match response.data.field == "email"
    And match response.data.message == "is invalid"

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
    And match response.data.field == "email"
    And match response.data.message == "is invalid"

  Scenario: Valid name, email, status but Gender field is blank
    And url baseUrl
    And request
      """
      {
        "name":"Nagesha",
        "email":"nagesha2@gmail.com",
        "gender":"",
        "status":"active"
      }
      """
    When method post
    Then status 422
    And match response.data.field == "gender"
    And match response.data.message == "can't be blank, can be male of female"

  Scenario: Valid name, email, gender but invalid status(Status other than active and inactive is given)
    And url baseUrl
    And request
      """
      {
        "name":"Nagesha",
        "email":"nagesha3@gmail.com",
        "gender":"male",
        "status":"A"
      }
      """
    When method post
    Then status 422
    And match response.data.field == "status"
    And match response.data.message == "can't be blank"

  Scenario: Valid email, gender, status but name field is blank
    And url baseUrl
    And request
      """
      {
        "name":"",
        "email":"nagesha4@gmail.com",
        "gender":"male",
        "status":"active"
      }
      """
    When method post
    Then status 422
    And match response.data.field == "name"
    And match response.data.message == "can't be blank"

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
    And match response.data.field == "email"
    And match response.data.message == "can't be blank"

  Scenario: Valid name, email, gender but status filed is empty
    And url baseUrl
    And request
      """
      {
        "name":"Nagesha",
        "email":"nagesha5@gmail.com",
        "gender":"male",
        "status":""
      }
      """
    When method post
    Then status 422
    And match response.data.field == "status"
    And match response.data.message == "can't be blank"