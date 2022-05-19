require "test_helper"

class NewPapersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get new_papers_index_url
    assert_response :success
  end
end
