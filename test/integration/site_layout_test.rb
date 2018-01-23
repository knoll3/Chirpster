require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
  
  def setup
    @user = users(:michael)
  end
  
  test "home page layout links" do
    get root_path
    assert_template 'static_pages/home'
    assert_select "a[href=?]", root_path, count: 2
    assert_select "a[href=?]", help_path
    assert_select "a[href=?]", about_path
    assert_select "a[href=?]", contact_path
  end
  
  test "user page layout links while logged in" do
    log_in_as(@user)
    get users_path
    assert_template 'users/index'
    assert_select "div.container"
    assert_select "a[href=?]", "/users/#{@user.id}"
  end

end
