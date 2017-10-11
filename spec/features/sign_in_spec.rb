require 'rails_helper'

RSpec.feature 'Admin Sign in', type: :feature do
  given(:admin) { create :admin }
  scenario 'Registered Admin try to sign in using email' do
    visit new_admin_session_path
    fill_in 'Логин или email', with: admin.email
    fill_in 'Пароль', with: admin.password
    click_on 'Войти'

    expect(page).to have_content 'Администратор'
    expect(current_path).to eq admin_dashboard_path
  end

  scenario 'Registered Admin try to sign in using username' do
    visit new_admin_session_path
    fill_in 'Логин или email', with: admin.username
    fill_in 'Пароль', with: admin.password
    click_on 'Войти'

    expect(page).to have_content 'Администратор'
    expect(current_path).to eq admin_dashboard_path
  end

  scenario 'Non-authenticated admin try to sign in' do
    visit new_admin_session_path
    click_on 'Войти'
    expect(page).to have_content 'Забыли пароль?'
  end

end
