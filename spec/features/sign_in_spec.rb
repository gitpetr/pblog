require 'rails_helper'

RSpec.feature 'Admin Sign in', type: :feature do
  given(:admin) { create :admin }
  scenario 'Registered Admin try to sign in' do
    # admin = Admin.create!(email: 'admin@ex.com', password: '123456', password_confirmation: '123456')
    visit new_admin_session_path
    fill_in 'Электронная почта', with: admin.email
    fill_in 'Пароль', with: admin.password
    click_on 'Войти'

    expect(page).to have_content 'Администратор'
    expect(current_path).to eq admin_dashboard_path
  end

  scenario 'Non-authenticated user try to create question' do
    visit new_admin_session_path
    click_on 'Войти'
    expect(page).to have_content 'Забыли пароль?'
  end
end
