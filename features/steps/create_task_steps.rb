Given(/^I have an account in ToDo App$/) do
  # @user = FactoryGirl.create :user
end

Given(/^I am logged in$/) do
  HomePage.new.sign_in
  LoginPage.new.login 'samuel.hcl@gmail.com', 'ac-recruit'
  # LoginPage.new.login @user.email, @user.password
end

Given(/^I access My Tasks page$/) do
  HomePage.new.my_tasks
end

Then(/^I should see a message saying that the task list is mine$/) do
  user = 'Samuel' # @user.name
  expect(page).to have_content "Hey #{user}, this is your todo list for today:"
end

Given(/^I enter the task description$/) do
  MyTasksPage.new.task_description 'my test task'
end

When(/^I click the add button$/) do
  MyTasksPage.new.click_add_button
end

Then(/^I should see the new task on the top of the list$/) do
  expect(first('[ng-repeat="task in tasks"]')).to have_content 'my test task'
end

When(/^I enter the task description and hit enter key$/) do
  MyTasksPage.new.create_task_hitting_enter 'my test task'
end

Given(/^I enter the task description with less than (\d+) characters$/) do |size|
  size = size.to_i - 1
  MyTasksPage.new.task_description 'a' * size
end

Then(/^I should see the error message "([^"]*)"$/) do |message|
  expect(page).to have_content message
end

Given(/^I enter the task description with more than (\d+) characters$/) do |size|
  size = size.to_i + 1
  MyTasksPage.new.task_description 'a' * size
end
