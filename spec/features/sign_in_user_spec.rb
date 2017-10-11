require 'rails_helper'

RSpec.feature 'User Sign in', type: :feature do
  given(:user) { create :user }
  given(:admin) { create :admin }

  scenario 'Registered User try to sign in using email' do
    visit new_user_session_path
    fill_in 'Логин или email', with: user.email
    fill_in 'Пароль', with: user.password
    click_on 'Войти'

    expect(page).to have_content 'Пользователь'
    expect(current_path).to eq dashboard_path
  end

  scenario 'Registered User try to sign in using username' do
    visit new_user_session_path
    fill_in 'Логин или email', with: user.username
    fill_in 'Пароль', with: user.password
    click_on 'Войти'

    expect(page).to have_content 'Пользователь'
    expect(current_path).to eq dashboard_path
  end

  scenario 'Non-authenticated user try to sign in' do
    visit new_user_session_path
    click_on 'Войти'
    expect(page).to have_content 'Забыли пароль?'
  end

  scenario 'Non-authenticated user try to read posts' do
    visit posts_path
    expect(page).to have_content 'Забыли пароль?'
  end

  scenario 'admin after user try sign in', js: true do
    visit user_session_path
    sign_in_user(user)
    visit posts_path
    visit admin_session_path
    expect(page).to have_content 'Hi All'
    expect(current_path).to eq root_path
  end

  scenario 'admin after user try sign in', js: true do
    visit admin_session_path
    sign_in_admin(admin)
    visit admin_posts_path
    visit user_session_path
    expect(page).to have_content 'Hi All'
    expect(current_path).to eq root_path
  end



end
