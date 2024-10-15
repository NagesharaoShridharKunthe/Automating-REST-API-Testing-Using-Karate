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


Automating_Rest_API_Testing_Using_Karate-2
└── .idea
 └── src
     └── main
     └── test
         └── java
             └── com.example
                 └── api
                     └── delete-users.feature
                     └── get-users.feature
                     └── post-users.feature
                     └── put-users.feature
                └──runner
                    └── ExecuteTest



## Writing Tests
The test cases are written in Karate's Gherkin syntax and include both positive and negative scenarios for testing CRUD operations on the `/public/v1/users` endpoint.

### Example Test Case: `POST` request in `post-users.feature`

Feature: User API tests

  Scenario: Create a new user
    Given url 'https://gorest.co.in/public/v1/users'
    And header Authorization = 'Bearer' + 'bc58c41bd681fdc1a355d261e04679e6c018538e3b9cc1d2a37b34aa006e4245'
    And request { "name": "Nagesha", "email": "nagesha@gmail.com", "gender": "male", "status": "active" }
    When method POST
    Then status 201
    And match response.name == 'Nagesha'


## Test Reporting and Execution Result
After running the tests, Karate generates detailed HTML reports.

### Sample Test Execution Result
For Delete Method:-
<img width="1438" alt="Screenshot 2024-10-14 at 5 57 36 PM" src="https://github.com/user-attachments/assets/c9745827-dd85-4356-a664-03a13d78facb">

For Get Mathod:-
<img width="1437" alt="Screenshot 2024-10-14 at 5 38 47 PM" src="https://github.com/user-attachments/assets/2e57b18c-1fe3-4482-a1a5-4fb3a2e2bfaa">

For Post Method:-
<img width="1438" alt="Screenshot 2024-10-14 at 5 32 30 PM" src="https://github.com/user-attachments/assets/acb7bb19-77dd-466b-8a6e-9883957c3080">

<img width="1433" alt="Screenshot 2024-10-14 at 5 33 01 PM" src="https://github.com/user-attachments/assets/b6db0091-dd92-4571-b7a2-bf4cca6ef8c7">

For Put Method:-
<img width="1439" alt="Screenshot 2024-10-14 at 5 55 10 PM" src="https://github.com/user-attachments/assets/4ce992a1-5c14-4bb2-9984-4102b9f2434b">
