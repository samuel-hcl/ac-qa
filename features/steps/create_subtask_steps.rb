Given(/^I have at least one task in my list$/) do
  # FactoryGirl.create :task
end

Then(/^I should see a button to manage subtasks of a task$/) do
  expect(page).to have_button '(0) Manage Subtasks'
end

Given(/^I have at least one subtask for a task$/) do
  # FactoryGirl.create :subtask
end

Then(/^I should see the number of subtasks of the task$/) do
  expect(page).to have_button '(1) Manage Subtasks'
end

When(/^I click the button to manage subtasks$/) do
  MyTasksPage.new.manage_sub_tasks
end

Then(/^I should see a modal dialog$/) do
  expect(MyTasksPage.new.sub_task_modal_present?).to eq true
end

Then(/^I should see a read only field with the task ID and description$/) do
  expect(MyTasksPage.new.task_id_field_disabled?).to eq true
end

Given(/^I enter the subtask description and due date in format MM\/dd\/yyyy$/) do
  MyTasksPage.new.fill_sub_task_fields 'subtask 1', '12/31/2018'
end

When(/^I click the add subtask button$/) do
  MyTasksPage.new.add_sub_task
end

Then(/^I should see the new subtask on the bottom of the list$/) do
  expect(MyTasksPage.new.last_sub_task).to have_content 'subtask 1'
end

Given(/^I enter the subtask description with more than (\d+) characters$/) do |size|
  size = size.to_i + 1
  MyTasksPage.new.sub_task_description 'a' * size
end

Given(/^I leave subtask description and due date empty$/) do
  MyTasksPage.new.fill_sub_task_fields '', ''
end

Given(/^I fill subtask due date with "([^"]*)"$/) do |date|
  MyTasksPage.new.fill_sub_task_fields 'subtask', date
end
