require 'test_helper'

class HomeTest < ActionDispatch::IntegrationTest
  test "can see the welcome page" do
    get "/"
    assert_select 'h1', "Hi All!"
  end
end
