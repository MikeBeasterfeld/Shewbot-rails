require 'test_helper'

class IrcUsersControllerTest < ActionController::TestCase
  setup do
    @irc_user = irc_users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:irc_users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create irc_user" do
    assert_difference('IrcUser.count') do
      post :create, irc_user: { name: @irc_user.name }
    end

    assert_redirected_to irc_user_path(assigns(:irc_user))
  end

  test "should show irc_user" do
    get :show, id: @irc_user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @irc_user
    assert_response :success
  end

  test "should update irc_user" do
    put :update, id: @irc_user, irc_user: { name: @irc_user.name }
    assert_redirected_to irc_user_path(assigns(:irc_user))
  end

  test "should destroy irc_user" do
    assert_difference('IrcUser.count', -1) do
      delete :destroy, id: @irc_user
    end

    assert_redirected_to irc_users_path
  end
end
