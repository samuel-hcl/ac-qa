@create_subtask
Feature: Create subtask

As a ToDo App user
I should be able to create a subtask
So I can break down my tasks in smaller pieces

Background:
Given I have an account in ToDo App
And I am logged in
And I access My Tasks page
And I have at least one task in my list

Scenario: Button to manage subtasks
Then I should see a button to manage subtasks of a task

Scenario: Button to manage subtasks with number of subtasks
Given I have at least one subtask for a task
Then I should see the number of subtasks of the task

@bug
Scenario: Task ID field should be read only
When I click the button to manage subtasks
Then I should see a modal dialog
And I should see a read only field with the task ID and description
@a
Scenario: Create subtask
Given I click the button to manage subtasks
Given I enter the subtask description and due date in format MM/dd/yyyy
When I click the add subtask button
Then I should see the new subtask on the bottom of the list

@bug
Scenario: Does not create subtask with description with more than 250 characters
Given I click the button to manage subtasks
And I enter the subtask description with more than 250 characters
When I click the add button
Then I should see the error message "SubTask description should have less than 250 characters."

@bug
Scenario: Does not create subtask with empty description and empty due date
Given I click the button to manage subtasks
And I leave subtask description and due date empty
When I click the add button
Then I should see the error message "SubTask description and due date are required."

@bug
Scenario Outline: Does not create subtask with invalid due date
Given I click the button to manage subtasks
And I fill subtask due date with <invalid_date>
When I click the add button
Then I should see the error message "SubTask due date invalid."

Examples:
| invalid_date |
| "2017/12/31" |
| "2017-12-31" |
| "31/12/2017" |
| "aaaaaaaaaa" |
|   "12312017" |
