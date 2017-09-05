class HomePage
  include Capybara::DSL

  def sign_in
    click_link 'Sign In'
  end

  def my_tasks
    find('li > a[href="/tasks"]').click
  end
end
