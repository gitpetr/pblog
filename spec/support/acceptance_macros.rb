module AcceptanceMacros
  def sign_in_user(user)
    visit new_user_session_path
    fill_in 'Логин или email', with: user.email
    fill_in 'Пароль', with: user.password
    click_on 'Войти'
  end

  def sign_in_admin(admin)
    visit new_admin_session_path
    fill_in 'Логин или email', with: admin.email
    fill_in 'Пароль', with: admin.password
    click_on 'Войти'
  end
end
