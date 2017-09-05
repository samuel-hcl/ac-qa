@create_task
Feature: Create Task

As a ToDo App user
I should be able to create a task
So I can manage my tasks

Background:
Given I have an account in ToDo App
And I am logged in
And I access My Tasks page

@bug
Scenario: User task list message
Then I should see a message saying that the task list is mine

Scenario: Create new task clicking add button
Given I enter the task description
When I click the add button
Then I should see the new task on the top of the list

Scenario: Create new task hitting enter key
When I enter the task description and hit enter key
Then I should see the new task on the top of the list

@bug
Scenario: Does not create task with description with less than 3 characters
Given I enter the task description with less than 3 characters
When I click the add button
Then I should see the error message "Task description should have more than 3 characters."

@bug
Scenario: Does not create task with description with more than 250 characters
Given I enter the task description with more than 250 characters
When I click the add button
Then I should see the error message "Task description should have less than 250 characters."
