require "test_helper"

class Web::PasswordResetsControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end

  test "should post create" do
    post :create
    assert_response :success
  end

  test "should get edit" do
    get :edit
    assert_response :success
  end

  test "should post update" do
    post :update
    assert_response :success
  end
end
