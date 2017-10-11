require 'rails_helper'

RSpec.feature 'CreatePosts', type: :feature do
  given(:admin) { create :admin }

  scenario 'Authenticated admin create post' do
    visit new_admin_session_path
    fill_in 'Логин или email', with: admin.email
    fill_in 'Пароль', with: admin.password
    click_on 'Войти'

    visit admin_posts_path
    click_on 'Новая'
    fill_in 'Title', with: 'тестовое название'
    fill_in 'Body', with: 'Текст статьи'
    click_on 'Сохранить'
    expect(page).to have_content 'тестовое название'

  end

  scenario 'Non Authenticated admin create post' do
    visit admin_posts_path
    expect(page).to have_content 'Вход Регистрация Войти'
  end
end
