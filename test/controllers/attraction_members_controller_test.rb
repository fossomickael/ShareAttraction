require "test_helper"

class AttractionMembersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get attraction_members_new_url
    assert_response :success
  end

  test "should get create" do
    get attraction_members_create_url
    assert_response :success
  end
end
