package com.example.runner;

import com.intuit.karate.Runner;

public class ExecuteTest {
    public static void main(String[] args) {
        Runner.path("src/test/java/com/example/api/delete-users.feature").parallel(1);
    }
}