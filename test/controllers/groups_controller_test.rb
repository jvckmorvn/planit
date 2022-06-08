require "test_helper"

class GroupsControllerTest < ActionDispatch::IntegrationTest

  # test "the truth" do
  #   assert true
  # end

  test "should get index" do
    get groups_index_url
    assert_response :success
  end

  test "should get create" do
    get groups_create_url
    assert_response :success
  end

end
