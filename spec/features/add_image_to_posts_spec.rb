require 'rails_helper'

RSpec.feature "AddImageToPosts", type: :feature do
  given(:admin) { create :admin }

  scenario 'attach image' do
    visit new_admin_session_path
    fill_in 'Логин или email', with: admin.email
    fill_in 'Пароль', with: admin.password
    click_on 'Войти'

    visit admin_posts_path
    click_on 'Новая'
    fill_in 'Title', with: 'тестовое название'
    fill_in 'Body', with: 'Текст статьи'
    attach_file 'Image', "#{Rails.root}/spec/test2.png"
    click_on 'Сохранить'
    click_on 'тестовое название'
    expect(page).to have_css("img[src*='test2.png']")
  end
end
