class MyTasksPage
  include Capybara::DSL
  
  def task_description(description)
    fill_in id: 'new_task', with: description
  end

  def create_task_hitting_enter(description)
    description << "\n"
    fill_in id: 'new_task', with: description
  end

  def click_add_button
    find('[ng-click="addTask()"]').click
  end

  def sub_task_modal_present?
    find('h3.modal-title').visible?
  end

  def fill_sub_task_fields(description, due_date)
    fill_in '#new_sub_task', with: description
    fill_in '#dueDate', with: due_date
  end

  def add_sub_task
    click_button 'Add'
  end

  def last_sub_task
    all('[ng-repeat="sub_task in task.sub_tasks"]').last
  end

  def sub_task_description(description)
    fill_in '#new_sub_task', with: description
  end

  def manage_sub_tasks
    all('button[ng-click="editModal(task)"]', minimum: 1).first.click
  end

  def task_id_field_disabled?
    find('#edit_task').disabled?
  end
end
