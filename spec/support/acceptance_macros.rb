module AcceptanceMacros
  def sign_in(admin)
    visit new_user_session_path
      fill_in 'Электронная почта', with: admin.email
      fill_in 'Пароль', with: admin.password
      click_on 'Войти'
      save_and_open_page
  end
end
