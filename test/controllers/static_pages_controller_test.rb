require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  
  def setup
    @base_title = "Ruby on Rails Tutorial Sample App"
  end
  
  test "should get root" do
    get root_url
    assert_response :success
  end
  
  pages = ["home", "help","about","contact"]
  
  pages.each do |page|
    test "should get #{page}" do
      eval("get static_pages_#{page}_url")
      assert_response :success
      assert_select "title", "#{page.capitalize} | #{@base_title}"
    end
  end

end
