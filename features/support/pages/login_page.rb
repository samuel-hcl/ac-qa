class LoginPage
  include Capybara::DSL

  def login(email, password)
    fill_in 'Email', with: email
    fill_in 'Password', with: password
    find('input[name="commit"]').click
    page.has_content? 'Signed in successfully.'
  end
end
