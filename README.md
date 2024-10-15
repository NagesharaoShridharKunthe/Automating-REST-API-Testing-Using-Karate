# Automating REST API Testing Using Karate

## Introduction
This project demonstrates the use of the Karate framework for automating REST API tests. The goal is to automate both positive and negative test cases for user-related operations such as creating, fetching, updating, and deleting users from the GoRest API.

## Features
- Automates REST API testing with Karate framework.
- Includes test cases for `POST`, `GET`, `PUT`, and `DELETE` operations on users.
- Validates response status codes and response body content.
- Handles positive and negative test scenarios.
- Detailed test reports are generated after execution.

## Prerequisites
- **Java JDK** (version 8 or higher)
- **Maven** for managing dependencies
- **IDE**: IntelliJ IDEA (or any IDE with Maven support)
- **Git** for version control

## Installation and Setup
1. Clone the repository from GitHub:
   
   git clone https://github.com/Govardhan-ZopSmart/Automating-REST-API
   

2. Navigate to the project directory:
   cd Automating-REST-API
   

3. Install Maven dependencies:
   mvn clean install
   

4. Make sure you have your GoRest API authentication token for executing the tests.

## Running Tests
To execute all the test cases, run the following Maven command:
mvn test


## Project Structure

```
RestAPIAutomatedTesting/
├── .idea/
│   ├── .gitignore
│   ├── encodings.xml
│   └── misc.xml
├── src/
│   └── test/
│       └── java/
│           └── com/
│               └── example/
│                   ├── api/
│                   │   ├── delete-user.feature
│                   │   ├── get-user.feature
│                   │   ├── post-user.feature
│                   │   └── put-user.feature
│                └── runner/
│                │   └── ExecuteTest.java
├── .gitignore
└── pom.xml
```



## Writing Tests
The test cases are written in Karate's Gherkin syntax and include both positive and negative scenarios for testing CRUD operations on the `/public/v1/users` endpoint.

### Example Test Case: `POST` request in `post-users.feature`
```
Feature: User API tests

  Scenario: Create a new user
    Given url 'https://gorest.co.in/public/v1/users'
    And header Authorization = 'Bearer' + 'bc58c41bd681fdc1a355d261e04679e6c018538e3b9cc1d2a37b34aa006e4245'
    And request { "name": "Nagesha", "email": "nagesha@gmail.com", "gender": "male", "status": "active" }
    When method POST
    Then status 201
    And match response.name == 'Nagesha'
```


## Test Reporting and Execution Result
After running the tests, Karate generates detailed HTML reports.

### Sample Test Execution Result

<img width="1436" alt="Screenshot 2024-10-15 at 12 37 56 PM" src="https://github.com/user-attachments/assets/5bf3c29e-4eb1-4c2c-b966-8d21f3a5c890">

<img width="1439" alt="Screenshot 2024-10-15 at 1 02 39 PM" src="https://github.com/user-attachments/assets/e106349f-2a89-4f8c-a920-e60bcfb531b3">

<img width="1322" alt="Screenshot 2024-10-15 at 1 04 37 PM" src="https://github.com/user-attachments/assets/e5c5c5c2-f19b-46cd-9156-73cea5fe1636">

View the command line output for a summary of passed and failed tests, and check the HTML report for more details.
